require 'sinatra'

get '/api/greet/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end
