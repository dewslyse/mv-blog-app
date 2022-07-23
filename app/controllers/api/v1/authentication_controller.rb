require_dependency 'authentication/authentication_user'

class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: %i[authenticate login]

  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token:)
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      render json: { status: 201, message: 'User login successfully!', content: { auth_token: } }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
