require 'sinatra'
require 'active_record'
require 'yaml'
require_relative 'models/weapon'

database_config = ENV['DATABASE_URL']

if database_config.blank?
  database_config = YAML::load(File.open('config/database.yml'))
end

ActiveRecord::Base.establish_connection(database_config)

after do
  ActiveRecord::Base.connection.close
end

get '/api/greet/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end

get '/api/weapons' do
  Weapon.all.to_json
end

post '/api/weapons' do
  status 201
  Weapon.create(params).to_json
end

patch '/api/weapons/:id' do |id|
  weapon = Weapon.find_by_id(id)

  halt 404 if weapon.nil?

  params.delete('splat')
  params.delete('captures')

  weapon.update(params)

  weapon.to_json
end
