source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Database
gem 'mongoid', '2.2.0'
gem 'bson_ext', '1.3.1'

# Authentication
gem 'sorcery'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'compass', "~> 0.12.alpha.0"
end

gem 'jquery-rails'

# Test Group
group :development, :test do
  gem 'rspec-rails', ">= 2.6.1"
  gem 'database_cleaner', ">= 0.6.7"
  gem 'mongoid-rspec', ">= 1.4.4"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda'

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'

  gem 'pry'
  gem 'pry-doc'
end
