require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# get '/calc' do
#   erb :calc
# end

get '/calc' do
  #binding.pry
  @first = params[:first].to_f
  @second = params[:second].to_f

  @result = case params[:operator]
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end

  erb :calc
end
