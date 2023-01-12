class SessionsController < ApplicationController

  # POST '/login'
  def create
    # byebug
    # we need to raise an exception in order to return an array of errors for the username
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  # DELETE '/logout'
  def destroy
    if session[:user_id]
      session.delete :user_id
      head :no_content
    else
      render json: { error: "Not logged in" }, status: :unauthorized
    end
  end

end
