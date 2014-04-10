class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(params[:recipe])

    redirect_to recipe
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    recipe = Recipe.find params[:id]
    recipe.update_attributes(params[:recipe])

    redirect_to recipe
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end
end
