# frozen_string_literal: true

ruby_version_file = File.expand_path(".ruby-version", __dir__)
ruby File.read(ruby_version_file).chomp if File.readable?(ruby_version_file)
source "https://rubygems.org"

gem "rails", "~> 7.0.8", ">= 7.0.8.1"

gem "bcrypt"
gem "delayed_job"
gem "delayed_job_active_record"
gem "feedbag"
gem "feedjira", ">= 3.2.3"
gem "httparty"
gem "nokogiri", "~> 1.15.6.0"
gem "pg"
gem "puma", "~> 6.0"
gem "rack-ssl"
gem "sass"
gem "sinatra", ">= 3.0.6"
gem "sinatra-activerecord", ">= 2.0.27"
gem "sinatra-contrib", ">= 3.0.6"
gem "sinatra-flash"
gem "sprockets", ">= 4.2.1"
gem "sprockets-helpers"
gem "thread"
gem "uglifier"
gem "will_paginate"

group :development do
  gem "rubocop", require: false
  gem "rubocop-rails", ">= 2.18.0", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
end

group :development, :test do
  gem "capybara", ">= 3.39.0"
  gem "coveralls_reborn", require: false
  gem "factory_bot_rails", ">= 6.3.0"
  gem "faker"
  gem "pry-byebug"
  gem "rspec"
  gem "rspec-html-matchers"
  gem "rspec-rails", ">= 6.0.2"
  gem "shotgun"
  gem "simplecov"
  gem "timecop"
  gem "webmock", require: false
end
