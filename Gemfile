source 'http://rubygems.org'

gem 'rails'
gem 'activesupport'
gem 'dalli'

#for deployment on Heroku

gem "heroku"

group :development, :test do
  gem 'pg'
end

group :production do
  gem 'pg'
  gem 'thin'
end
