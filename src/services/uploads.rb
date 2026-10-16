require 'securerandom'

class App::Services::Uploads < App::Services::Base
  DIR = File.join(App.root, 'uploads')
  TYPES = { 'image/png' => '.png', 'image/jpeg' => '.jpg', 'image/webp' => '.webp', 'image/gif' => '.gif' }.freeze
  MAX_BYTES = 5 * 1024 * 1024

  # Multipart field `file` → stored under uploads/, served at /uploads/<name>.
  def create
    file = rp['file']
    return_errors!('Please choose an image file.') unless file.is_a?(Hash) && file[:tempfile]
    ext = TYPES[file[:type]] || return_errors!('Only PNG, JPG, WebP or GIF images are allowed.')
    return_errors!('Images must be 5 MB or smaller.') if file[:tempfile].size > MAX_BYTES

    FileUtils.mkdir_p(DIR)
    name = "#{SecureRandom.hex(10)}#{ext}"
    FileUtils.cp(file[:tempfile].path, File.join(DIR, name))
    return_success(url: "/uploads/#{name}")
  end

  def self.serve(r, name)
    path = File.join(DIR, File.basename(name))
    r.halt(404) unless File.file?(path)
    r.response['Content-Type'] = Rack::Mime.mime_type(File.extname(path))
    r.response['Cache-Control'] = 'public, max-age=31536000, immutable'
    File.binread(path)
  end

  def self.fields
    {}
  end
end
