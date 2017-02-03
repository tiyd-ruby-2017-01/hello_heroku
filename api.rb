require 'sinatra'
require 'active_record'
require 'yaml'

database_config = ENV['DATABASE_URL']

if database_config.blank?
  database_config = YAML::load(File.open('config/database.yml'))
end

ActiveRecord::Base.establish_connection(database_url)

after do
  ActiveRecord::Base.connection.close
end

get '/api/greet/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end
