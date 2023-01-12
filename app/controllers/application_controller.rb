class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
rescue_from ActiveRecord::RecordNotFound, with: :render_errors

  private

    def user_params
      params.permit(:username, :password, :image_url, :bio)
    end
    
    def render_unprocessable_entity(invalid)
      # byebug
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_errors(error)
      # byebug
      render json: { errors: error.record.errors.full_messages }, status: :unauthorized
    end

end
