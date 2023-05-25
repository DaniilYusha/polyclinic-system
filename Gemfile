source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'importmap-rails', '~> 1.1', '>= 1.1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
gem 'stimulus-rails', '~> 1.2', '>= 1.2.1'
gem 'turbo-rails', '~> 1.4'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 1.51'
end

group :development do
  gem 'web-console'
end
