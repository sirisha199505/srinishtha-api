require 'cgi'

# Server-side SEO for the single-page app: every HTML response carries the
# page's own title, description, canonical URL, social tags and JSON-LD, built
# from the same content blocks the frontend renders. Also serves robots.txt,
# sitemap.xml and the permanent redirects for the old site's URLs.
class App::Services::Seo
  STATIC = {
    '/' => 'home', '/capabilities' => 'capabilities', '/solutions' => 'solutions', '/industries' => 'industries',
    '/work' => 'work', '/products' => 'products', '/about' => 'about', '/leadership' => 'leadership',
    '/how-we-work' => 'howWeWork', '/security' => 'security', '/careers' => 'careers', '/life' => 'life',
    '/insights' => 'insights', '/contact' => 'contact', '/privacy' => 'privacy'
  }.freeze

  # Detail pages: URL prefix → [content block, title field, description field, section page key, schema type]
  DETAIL = {
    'capabilities' => ['capabilities', 'title', 'summary', 'capabilities', 'Service'],
    'solutions' => ['solutions', 'title', 'lede', 'solutions', 'Service'],
    'work' => ['caseStudies', 'title', 'summary', 'work', 'Article']
  }.freeze

  REDIRECTS = {
    '/services' => '/capabilities', '/about-us' => '/about', '/contact-us' => '/contact',
    '/resources/case-studies' => '/work'
  }.freeze

  def self.site_url
    (ENV['SITE_URL'] || 'https://www.srinishtha.com').chomp('/')
  end

  def self.content
    App::Models::ContentBlock.where(active: true).all.to_h { |b| [b.key, b.plain_payload] }
  end

  # → [status, html]
  def self.page(path)
    path = path.chomp('/') if path.length > 1
    site = content
    meta = resolve(path, site)
    [meta[:status], render(meta, site)]
  end

  def self.resolve(path, site)
    pages = site['pages'] || {}
    company = site['company'] || {}
    name = company['name'] || 'Srinishtha Technologies'

    if path.start_with?('/admin')
      return { status: 200, title: "Admin | #{name}", description: '', robots: 'noindex, nofollow', path: path }
    end

    if (key = STATIC[path])
      page = pages[key] || {}
      title = key == 'home' ? page['title'] : "#{page['title']} | #{name}"
      crumbs = key == 'home' ? nil : [[page['title'], path]]
      return { status: 200, title: title, description: page['description'], path: path, crumbs: crumbs, home: key == 'home' }
    end

    section, slug, extra = path.delete_prefix('/').split('/')
    if extra.nil? && slug && (spec = DETAIL[section])
      block, title_field, desc_field, section_key, type = spec
      item = Array(site[block]).find { |i| i['slug'] == slug }
      if item
        section_title = pages.dig(section_key, 'title').to_s.split(' — ').first
        image = item['screenshot'] || item['image']
        return {
          status: 200, title: "#{item[title_field]} | #{name}", description: item[desc_field], path: path,
          image: image, type: type, item: item,
          crumbs: [[section_title, "/#{section}"], [item['client'] || item['title'], path]]
        }
      end
    end

    page = pages['notFound'] || {}
    { status: 404, title: "#{page['title'] || 'Page not found'} | #{name}", description: page['description'], robots: 'noindex', path: path }
  end

  def self.render(meta, site)
    html = File.read(File.join(App.root, 'public', 'index.html'))
    url = "#{site_url}#{meta[:path] == '/' ? '/' : meta[:path]}"
    image = "#{site_url}#{meta[:image] || '/images/office-space.jpeg'}"
    e = ->(v) { CGI.escapeHTML(v.to_s) }

    tags = [
      %(<meta name="description" content="#{e.(meta[:description])}" />),
      %(<meta name="robots" content="#{meta[:robots] || 'index, follow'}" />),
      (%(<link rel="canonical" href="#{e.(url)}" />) unless meta[:status] == 404),
      %(<meta property="og:title" content="#{e.(meta[:title])}" />),
      %(<meta property="og:description" content="#{e.(meta[:description])}" />),
      %(<meta property="og:url" content="#{e.(url)}" />),
      %(<meta property="og:image" content="#{e.(image)}" />),
      %(<meta name="twitter:card" content="summary_large_image" />),
      *json_ld(meta, site, url, image).map { |data| %(<script type="application/ld+json">#{data.to_json.gsub('</', '<\/')}</script>) }
    ].compact.join("\n    ")

    html
      .sub(%r{<title>.*?</title>}m, "<title>#{e.(meta[:title])}</title>")
      .gsub(%r{\s*<meta name="description"[^>]*>}, '')
      .gsub(%r{\s*<meta property="og:image"[^>]*>}, '')
      .sub('</head>', "    #{tags}\n  </head>")
  end

  def self.json_ld(meta, site, url, image)
    name = site.dig('company', 'name') || 'Srinishtha Technologies'
    org = { '@type' => 'Organization', 'name' => site.dig('company', 'legalName') || name, 'url' => site_url }
    data = []

    if meta[:home]
      data << { '@context' => 'https://schema.org', '@type' => 'WebSite', 'name' => name, 'url' => "#{site_url}/" }
    end

    if meta[:crumbs]
      items = [['Home', '/'], *meta[:crumbs]].each_with_index.map do |(label, path), i|
        { '@type' => 'ListItem', 'position' => i + 1, 'name' => label, 'item' => "#{site_url}#{path}" }
      end
      data << { '@context' => 'https://schema.org', '@type' => 'BreadcrumbList', 'itemListElement' => items }
    end

    case meta[:type]
    when 'Service'
      data << { '@context' => 'https://schema.org', '@type' => 'Service', 'name' => meta[:item]['title'],
                'description' => meta[:description], 'provider' => org, 'areaServed' => 'Worldwide', 'url' => url }
    when 'Article'
      data << { '@context' => 'https://schema.org', '@type' => 'Article', 'headline' => meta[:item]['title'],
                'description' => meta[:description], 'image' => image, 'author' => org, 'publisher' => org,
                'mainEntityOfPage' => url }
    end
    data
  end

  def self.robots
    <<~TXT
      User-agent: *
      Allow: /
      Disallow: /admin
      Disallow: /api/

      Sitemap: #{site_url}/sitemap.xml
    TXT
  end

  def self.sitemap
    site = content
    lastmod = (App::Models::ContentBlock.max(:updated_at) || Time.now).utc.strftime('%Y-%m-%d')
    paths = STATIC.keys + DETAIL.flat_map { |section, (block)| Array(site[block]).map { |i| "/#{section}/#{i['slug']}" } }
    urls = paths.map do |path|
      priority = path == '/' ? '1.0' : path.count('/') == 1 ? '0.8' : '0.6'
      "  <url><loc>#{CGI.escapeHTML("#{site_url}#{path}")}</loc><lastmod>#{lastmod}</lastmod><priority>#{priority}</priority></url>"
    end
    %(<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n#{urls.join("\n")}\n</urlset>\n)
  end
end
