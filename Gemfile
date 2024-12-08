source "https://rubygems.org"

gem "rails", "~> 7.1.5"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"

# Authentication/Authorization
gem 'devise'
gem 'pundit'

# Frontend
gem 'tailwindcss-rails'
gem "view_component", "~> 3.20"
gem "view_component-contrib", "~> 0.2.3"
gem "dry-initializer", "~> 3.1"

# Background Processing & Caching
gem "solid_queue"
gem "solid_cache"
gem "solid_cable"

gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Deployment
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem "tailwind_merge", "~> 0.13.3"
