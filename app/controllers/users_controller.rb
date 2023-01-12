class UsersController < ApplicationController
  wrap_parameters format: []
  
  # POST '/signup'
  def create
    # byebug
    new_user = User.create!(user_params)
    render json: new_user, status: :created
  end

  # GET '/me'
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
  end

  end


end
