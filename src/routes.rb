
class App::Routes < Roda
  include App::Router::AllPlugins
  plugin :not_found do
    { status: 'error', data: 'Not Found' }
  end

  def do_crud(klass, r, only='CRUDL', opts = {})
    r.post { klass[r, opts].create } if only.include?('C')
    r.get(Integer) {|id| klass[r, opts.merge(id: id)].get} if only.include?('R')
    r.get { klass[r, opts].list } if only.include?('L')
    r.put(Integer) {|id| klass[r, opts.merge(id: id)].update } if only.include?('U')
    r.delete(Integer) {|id| klass[r, opts.merge(id: id)].delete } if only.include?('D')
  end

  route do |r|
    r.public

    # Old srinishtha.com URLs → permanent redirects so search rankings carry over
    if (target = Seo::REDIRECTS[r.path_info.chomp('/')])
      r.redirect(target, 301)
    end

    r.get('robots.txt') do
      r.response['Content-Type'] = 'text/plain'
      Seo.robots
    end

    r.get('sitemap.xml') do
      r.response['Content-Type'] = 'application/xml'
      Seo.sitemap
    end

    # Images uploaded from the admin panel (kept outside public/, which the frontend build replaces)
    r.get('uploads', String) { |name| Uploads.serve(r, name) }

    r.on 'api' do
      r.response['Content-Type'] = 'application/json'
      
      # Public endpoints (no auth required)
      r.post('login') { Session[r].login }
      r.post('forgot-password') { Users[r].forgot_password }
      r.post('validate-password-token') { Users[r].validate_password_token }
      r.post('reset-password') { Users[r].reset_password }
      
      r.get 'version' do
        { status: 'success', version: 1 }
      end

      # Public website: one content call + lead capture
      r.get('site') { Site[r].show }
      r.post('leads') { Leads[r].create }

      # Authentication required for all routes below
      auth_required!

      # User profile routes
      r.on 'me' do
        r.get('info') { Users[r].info }
        r.put('update-password') { Users[r].update_password }
      end

      # Admin-only routes
      admin_required!
      
      # Wrap all admin routes in error handling
      begin
        r.on 'users' do
          do_crud(Users, r, 'CRUDL')
        end

        r.on 'leads' do
          do_crud(Leads, r, 'RUL')
        end

        r.on 'content-blocks' do
          do_crud(ContentBlocks, r, 'CRUDL')
        end

        r.post('uploads') { Uploads[r].create }
        
        # Add other admin routes here
      rescue => e
        App.logger.error("API Error: #{e.message}")
        App.logger.error(e.backtrace)
        { status: 'error', message: "An error occurred: #{e.message}" }
      end
    end

    # Every page of the single-page app, with server-rendered SEO tags (404 for unknown paths)
    r.get do
      status, html = Seo.page(r.path)
      r.response.status = status
      r.response['Content-Type'] = 'text/html; charset=utf-8'
      r.response['Cache-Control'] = 'no-cache'
      html
    end
  end

  before do
    @time = Time.now
    App::Helpers::Before.run!(request)
  end

  after do |res|
    rtype = request.request_method
    App.logger.info("→ [#{Time.now - @time} seconds] - [#{rtype}]#{request.path}")
  end

  def auth_required!
    unless App.cu.valid?
      request.halt(401, {'Content-Type' => 'application/json'},{ status: 'Unauthorized!' }.to_json)
    end
  end

  def admin_required!
    unless (App.cu.user_obj.admin? || App.cu.user_obj.rgm?)
      request.halt(403, {'Content-Type' => 'application/json'},{ status: 'Forbidden!' }.to_json)
    end
  end
end

App.require_blob('services/base.rb')
App.require_blob('services/*.rb')

App::Routes.send(:include, App::Services)