require 'securerandom'

class App::Services::Uploads < App::Services::Base
  DIR = File.join(App.root, 'uploads')
  # Identify images by their first bytes, never by the browser-supplied type.
  SIGNATURES = {
    '.png' => ->(b) { b.start_with?("\x89PNG\r\n\x1A\n".b) },
    '.jpg' => ->(b) { b.start_with?("\xFF\xD8\xFF".b) },
    '.gif' => ->(b) { b.start_with?('GIF87a'.b, 'GIF89a'.b) },
    '.webp' => ->(b) { b[0, 4] == 'RIFF'.b && b[8, 4] == 'WEBP'.b }
  }.freeze
  MAX_BYTES = 5 * 1024 * 1024

  # Multipart field `file` → stored under uploads/, served at /uploads/<name>.
  def create
    file = rp['file']
    return_errors!('Please choose an image file.') unless file.is_a?(Hash) && file[:tempfile]
    return_errors!('Images must be 5 MB or smaller.') if file[:tempfile].size > MAX_BYTES
    head = File.binread(file[:tempfile].path, 16).to_s.b
    ext = SIGNATURES.find { |_, matches| matches.(head) }&.first
    return_errors!('Only PNG, JPG, WebP or GIF images are allowed.') unless ext

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
