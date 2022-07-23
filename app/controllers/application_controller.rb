class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: :json_request

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authorize_request, if: :json_request

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    else
      super
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def json_request
    request.format.json?
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
