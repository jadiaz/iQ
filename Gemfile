source 'http://rubygems.org'

gem 'rails', '3.2.6'

# Database
gem 'mongoid', '2.3.4'
gem 'bson_ext', '1.5.1'

# Authentication
gem 'sorcery'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'pry'
  gem 'pry-doc'
end

group :test do
  gem 'mongoid-rspec'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda'
end
