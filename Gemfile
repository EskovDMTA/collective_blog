# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'mini_magick'
gem 'rails', '~> 7.0.4'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'image_processing', '~> 1.2'
gem 'rubocop-discourse'
gem 'sassc-rails'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'simple_form'
gem 'slim'
gem 'sprockets-rails'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
# gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem 'ancestry'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'faker'
gem 'jsbundling-rails'
gem 'minitest-power_assert'
gem 'slim_lint'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'rubocop-minitest'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-slim'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end
