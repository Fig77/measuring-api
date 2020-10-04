module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show; end

    def update; end

    def destroy; end
  end
end
