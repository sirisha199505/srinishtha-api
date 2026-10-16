require 'dotenv/load'
require './src/app'
namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    puts "Migrating#{" to #{version}" if version}"
    Sequel.connect(App.db_url) do |db|
      db.extension :pg_enum
      Sequel::Migrator.run(db, "src/migrations", target: version)
    end
  end

  desc "Upsert website content (src/seeds/content.rb) into content_blocks"
  task :seed do
    require 'bundler'
    Bundler.require(:default)
    App.load!
    require './src/seeds/content'
    count = App::Seeds::Content.run!
    puts "Seeded #{count} content blocks"
  end
end


namespace :admin do
  desc "Create or reset an admin user: rake admin:create EMAIL=... NAME=... [PASSWORD=...]"
  task :create do
    require 'bundler'
    require 'securerandom'
    Bundler.require(:default)
    App.load!

    email = ENV['EMAIL'].to_s.strip.downcase
    name = ENV['NAME'].to_s.strip
    abort 'EMAIL and NAME are required' if email.empty? || name.empty?
    password = ENV['PASSWORD'].to_s.empty? ? SecureRandom.urlsafe_base64(15) : ENV['PASSWORD']
    abort 'PASSWORD must be at least 12 characters' if password.length < 12

    user = App::Models::User.first(email: email) || App::Models::User.new(email: email)
    user.full_name = name
    user.role = App::Models::User::ROLES[:admin]
    user.active = true
    user.password = password
    abort "Could not save admin: #{user.errors.full_messages.join(', ')}" unless user.save

    puts "Admin ready: #{email} (id #{user.id})"
    puts "Password: #{password}" if ENV['PASSWORD'].to_s.empty?
    puts 'Change it after first login: PUT /api/me/update-password'
  end
end


require 'optparse'


namespace :create do
  desc "Creates Model"
  task :models do
    models = []
    OptionParser.new do |opts|
      opts.banner = "Usage: rake create:models [options]"
      opts.on("-n", "--names ARG", String) { |str| models += str.split(',') }
    end.parse!
    puts models
    exit
  end
end

# Usage: rake db:migrate            (DB_URL is read from .env)
# To rollback: rake db:migrate[0]
# Content: rake db:seed
