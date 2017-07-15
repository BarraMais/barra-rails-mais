source 'https://rubygems.org'
ruby "2.3.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
gem 'rails-i18n', '~> 5.0.0'
# Use mysql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'active_model_serializers'
gem 'awesome_print'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'devise-i18n'
gem 'jwt'
gem 'omniauth-facebook'
gem 'rack-cors'
gem 'rubocop', '~> 0.47.0', require: false
gem 'simplecov', require: false, group: :test
gem 'validates_timeliness', '~> 4.0'
gem 'paperclip', '~> 5.0.0'
gem 'rails-controller-testing'
gem 'link_thumbnailer'
gem 'paperclip-av-transcoder'
gem 'acts_as_votable'
gem 'acts_as_commentable_with_threading'
gem 'aws-sdk'
gem 'active_record_union'
gem 'activity_notification'

# Painel admin
gem 'rails_admin', '~> 1.2'
gem 'rails_admin_rollincode', '~> 1.0'
gem 'cancancan'
gem 'rolify'

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Access an IRB console on exception pages or by
  # using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
