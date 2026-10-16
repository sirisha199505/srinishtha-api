module Middleware
  # In-memory, per-IP rate limiting for the endpoints attackers target.
  # Fine for a single server; switch to Redis-backed limits if you run several.
  class RateLimit
    RULES = {
      ['POST', '/api/login'] => { limit: 10, period: 15 * 60 },
      ['POST', '/api/forgot-password'] => { limit: 5, period: 60 * 60 },
      ['POST', '/api/reset-password'] => { limit: 10, period: 60 * 60 },
      ['POST', '/api/leads'] => { limit: 5, period: 10 * 60 },
      ['POST', '/api/uploads'] => { limit: 60, period: 60 * 60 }
    }.freeze

    def initialize(app)
      @app = app
      @hits = Hash.new { |h, k| h[k] = [] }
      @mutex = Mutex.new
    end

    def call(env)
      rule = RULES[[env['REQUEST_METHOD'], env['PATH_INFO'].chomp('/')]]
      return @app.call(env) unless rule

      key = "#{Rack::Request.new(env).ip}|#{env['PATH_INFO']}"
      retry_after = throttle(key, rule)
      return too_many(retry_after) if retry_after

      @app.call(env)
    end

    private

    def throttle(key, rule)
      now = Time.now.to_f
      @mutex.synchronize do
        hits = @hits[key]
        hits.reject! { |t| t <= now - rule[:period] }
        return (hits.first + rule[:period] - now).ceil if hits.size >= rule[:limit]

        hits << now
        @hits.delete_if { |_, v| v.empty? } if @hits.size > 10_000
        nil
      end
    end

    def too_many(retry_after)
      body = { status: 'error', data: 'Too many attempts. Please wait a few minutes and try again.' }.to_json
      [429, { 'content-type' => 'application/json', 'retry-after' => retry_after.to_s }, [body]]
    end
  end
end
