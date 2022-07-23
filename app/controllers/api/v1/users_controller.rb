class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: { status: 201, message: 'User created successfully!', content: { auth_token: } }
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end
end
