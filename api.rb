require 'sinatra'
require 'active_record'
require 'yaml'

database_config = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(database_config)

after do
  ActiveRecord::Base.connection.close
end

get '/api/greet/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end

