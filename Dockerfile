FROM ruby:3.4.7-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential libpq-dev libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV RACK_ENV=production \
    BUNDLE_WITHOUT=development \
    BUNDLE_DEPLOYMENT=1

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4

COPY . .

# Render (and most hosts) provide PORT; default to 8080 locally
EXPOSE 8080
CMD ["sh", "-c", "bundle exec puma -b tcp://0.0.0.0:${PORT:-8080} -e production config.ru"]
