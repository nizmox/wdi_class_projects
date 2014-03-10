require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'YahooFinance'

require 'active_support/all' #allows the .present? method

get '/' do
  @code = params[:code]
  if @code.present?
    @code.upcase!
    @data = YahooFinance::get_quotes(YahooFinance::StandardQuote, @code)[@code]
  end

  #binding.pry

  erb :stock

end