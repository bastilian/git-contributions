source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Ruby-Git to work with local git repositories
gem 'git'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Simple form to build forms
gem 'simple_form'

# YARD for documentation
gem 'yard-rails-pack', git: 'https://github.com/badgerhq/yard-rails-pack.git', require: false

gem 'puma'

group :development, :test do
  # For debugging
  gem 'byebug'

  # Test data generation
  gem 'factory_girl_rails'
  gem 'faker'

  # Speeding up development with Spring
  gem 'spring'

  # Guard for automation
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rails', require: false

  # Pry for a better console
  gem 'pry-rails'
end

group :test do
  # RSpec for testing
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'

  # Database cleanup
  gem 'database_cleaner'

  gem 'codeclimate-test-reporter', require: nil
end
