require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :form
end

post '/' do
  # binding.pry
  f = File.new('receipt.txt','a+')

  #Write each line to the file
  f.puts("- Compay Name: #{ params[:company] }")
  f.puts("- Good/Service Provided: #{ params[:service] }")
  f.puts("- Cost: #{ params[:cost] }")
  f.puts("- Thankyou for your patronage")
  f.puts("")

  f.close

  erb :form
end

#Time.now.to_i