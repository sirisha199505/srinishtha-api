module Middleware
  # Adds browser security headers to every response.
  class SecurityHeaders
    CSP = [
      "default-src 'self'",
      "script-src 'self'",
      "style-src 'self' 'unsafe-inline'",
      "img-src 'self' data:",
      "font-src 'self' data:",
      "connect-src 'self'",
      "frame-ancestors 'none'",
      "base-uri 'self'",
      "form-action 'self'",
      "object-src 'none'"
    ].join('; ').freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers['content-security-policy'] ||= CSP
      headers['x-content-type-options'] = 'nosniff'
      headers['x-frame-options'] = 'DENY'
      headers['referrer-policy'] = 'strict-origin-when-cross-origin'
      headers['permissions-policy'] = 'camera=(), microphone=(), geolocation=()'
      headers['strict-transport-security'] = 'max-age=31536000; includeSubDomains' if App.env == 'production'
      [status, headers, body]
    end
  end
end
