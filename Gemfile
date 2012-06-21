source 'http://rubygems.org'

gem 'rails'
gem 'activesupport'

#for deployment on Heroku

gem "heroku"

group :development, :test do
  gem 'sqlite3', :require => 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end
