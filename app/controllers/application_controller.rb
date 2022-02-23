class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit
  include Security::SecurityOperation
  include Security::RoleModule
  include Cache::RedisCache
  include Log::FileLogger
  include CustomError::ErrorHandler

  def user_not_authorized
    @message = "You have no auth"
    render json: {message: @message},status:401
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username,:email, :password, :password_confirmation])
  end

end
