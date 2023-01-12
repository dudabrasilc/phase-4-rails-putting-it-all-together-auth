class RecipesController < ApplicationController
  wrap_parameters format: []

  # GET /recipes
  def index
    # byebug
    recipes = Recipe.all
    render json: recipes
  end

  # POST '/recipes'
  def create
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      new_recipe = User.recipes.create!(recipe_params)
      render json: new_recipe, status: :created
    else
      render json: { error: "Not logged in" }, status: :unauthorized
    end
  end

private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete, :user_id)
  end

end
