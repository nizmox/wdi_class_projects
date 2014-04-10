class PlanetsController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @planets = Planet.order(:orbit)
  end

  def new

  end

  def create
    # raise params.inspect
    # render :text => 'testing'
    Planet.create(params[:planet])
    redirect_to 'root'
  end

  def edit
    @planet = Planet.find params[:id]
  end

  def show
    @planet = Planet.find params[:id]
  end

  def destroy
    planet = Planet.find params[:id]
    planet.destroy

    redirect_to '/planets'
  end

  def update
    planet = Planet.find params[:id]
    # raise params.inspect
    planet.update_attributes( params[:planet] )
    redirect_to planets_path 
  end

end