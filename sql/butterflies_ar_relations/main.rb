require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'pg'

#code to allow sinatra to interact with ActiveRecord
require 'active_record'
require 'protected_attributes'

require_relative './models/butterfly.rb'
require_relative './models/plant.rb'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :pool => 8,
  :username => 'Nizmox', #your postgres.app username
  :password => "",
  :database => "butterflies_app"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

before do
  @families = Butterfly.select(:family).distinct
end

after { ActiveRecord::Base.connection.close }

get '/' do
  erb :home
end

get '/butterflies' do
  @butterflies = Butterfly.all.order(:name)

  erb :butterflies
end

get '/butterflies/new' do
  @plants = Plant.all

  binding.pry

  erb :new_butterfly
end

post '/butterflies/create' do

  butterfly = Butterfly.new
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.photo = params[:photo]

  if params[:plant_id].to_i > 0
    plant = Plant.find params[:plant_id]
    butterfly.plant = plant
  end

  butterfly.save

  redirect to("/butterflies/#{ butterfly.id }")  
end

post '/butterflies/update' do

  butterfly = Butterfly.find params[:id]
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.photo = params[:photo]

  butterfly.plant_id = params[:plant_id]

  butterfly.save

  redirect to("/butterflies/#{ params[:id] }")
end

get '/butterflies/:id' do
  @butterfly = Butterfly.find(params[:id])

  @plant = @butterfly.plant

  erb :butterfly
end

get '/butterflies/family/:family' do
  @butterflies = Butterfly.where :family => params[:family]

  erb :butterflies
end

get '/butterflies/:id/delete' do
  @butterfly = Butterfly.find(params[:id])
  @butterfly.destroy

  redirect to('butterflies')
end

get '/butterflies/:id/edit' do
  @butterfly = Butterfly.find(params[:id])

  @plants = Plant.all

  erb :edit_butterfly
end

# ----------- Plant Routes Start Here -----------

get '/plants' do
  @plants = Plant.all

  erb :plants
end

get '/plants/new' do
  erb :new_plant
end

post '/plants/create' do

  plant = Plant.new
  plant.name = params[:name]
  plant.latin_name = params[:latin_name]
  plant.region = params[:region]
  plant.photo = params[:photo]
  plant.save

  redirect to("/plants/#{ plant.id }")  
end

get '/plants/:id' do
  @plant = Plant.find params[:id]

  @butterflies = @plant.butterflies

  erb :plant
end