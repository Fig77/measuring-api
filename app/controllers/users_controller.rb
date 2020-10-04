class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def create
  end

  def update # only on himself
  end

  private

  def user_params
    params.permit(:username, :email, :password_digest)
  end

  def user_update
    params.permit(:email)
  end
end
