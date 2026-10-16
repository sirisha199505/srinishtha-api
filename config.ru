require 'bundler'
require 'dotenv/load'
require 'open-uri'
require 'csv'
Rack::Utils # Patch
require './src/app'

Bundler.require(:default, App.env)


# The site and API share one origin, so cross-origin calls are only allowed from
# the configured site (plus the Vite dev server in development).
ALLOWED_ORIGINS = [
  *ENV.fetch('CORS_ORIGINS', ENV.fetch('SITE_URL', 'https://www.srinishtha.com')).split(',').map(&:strip),
  *(App.development? ? ['http://localhost:5173', 'http://127.0.0.1:5173'] : [])
].freeze

use Rack::Cors do
  allow do
    origins(*ALLOWED_ORIGINS)
    resource '/api/*', headers: %w[Content-Type Authorization], methods: [:get, :post, :put, :delete, :options]
  end
end

App.load!

use Middleware::SecurityHeaders
use Middleware::RateLimit

run App::Routes

if App.development?
  Listen.to(File.expand_path(File.dirname(__FILE__)), only: %r{.rb$}) do |added, modified, removed|
    files_to_reload = added + modified
    
    App.logger.info("Reloading: #{files_to_reload.join(', ')}")
    
    # Handle route file specially to ensure proper reloading
    if files_to_reload.any? { |f| f.include?('routes.rb') }
      App.logger.info("Routes file changed, consider restarting the server for full effect")
      # Optionally implement more sophisticated routes reloading here
    end
    
    # Reload all changed files
    files_to_reload.each do |f|
      begin
        load(f)
        App.logger.info("Successfully reloaded: #{f}")
      rescue => e
        App.logger.error("Error reloading #{f}: #{e.message}")
        App.logger.error(e.backtrace.join("\n"))
      end
    end
  end.start
end
