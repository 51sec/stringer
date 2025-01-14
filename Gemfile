# frozen_string_literal: true

ruby_version_file = File.expand_path(".ruby-version", __dir__)
ruby File.read(ruby_version_file).chomp if File.readable?(ruby_version_file)
source "https://rubygems.org"

gem "rails", "~> 7.0.1"

gem "bcrypt"
gem "delayed_job"
gem "delayed_job_active_record"
gem "feedbag"
gem "feedjira"
gem "httparty"
gem "nokogiri", "~> 1.14.0.rc1"
gem "pg"
gem "puma", "~> 6.0"
gem "rack-ssl"
gem "sass"
gem "sinatra"
gem "sinatra-activerecord"
gem "sinatra-contrib"
gem "sinatra-flash"
gem "sprockets"
gem "sprockets-helpers"
gem "thread"
gem "uglifier"
gem "will_paginate"

group :development do
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
end

group :development, :test do
  gem "capybara"
  gem "coveralls_reborn", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "rspec"
  gem "rspec-html-matchers"
  gem "rspec-rails"
  gem "shotgun"
  gem "simplecov"
  gem "timecop"
  gem "webmock", require: false
end
