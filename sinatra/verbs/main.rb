require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

post '/contact' do
  # binding.pry  
  erb :thankyou
end

get '/search' do
  "You searched for #{ params[:query] }. There are #{ rand(100) } results."
end

post '/subscribe' do
  "Thankyou for giving us all of your $$$$"
end
