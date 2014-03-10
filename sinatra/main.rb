require 'pry'
require 'sinatra'
require 'sinatra/reloader' #every time we make changes to the file we don't want to shutdown the server and restart

get '/' do
  "<html><body><em>Hello</em> World<body></html>"
end

get '/hello' do
  "my first working web server"
end

get '/goodbye' do
  "so long and thanks etc"
end

#creates a params hash, with the key of :first and the value = the data after the user input
get '/name/:first' do
  "hello #{ params[:first] }"
end

get '/name/:first/:last' do
  "hi there #{ params[:first] } #{ params[:last] }"
end

get '/name/:first/:last/:age' do
  "#{ params[:first] } #{ params[:last] } is #{ params[:age]} years old"
end

get '/multiply/:x/:y' do
  result = params[:x].to_f * params[:y].to_f
  "the result of #{params[:x]} x #{params[:y]} = #{result}"
end

#binding.pry