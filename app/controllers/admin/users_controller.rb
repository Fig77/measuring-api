module Admin 
  class UsersController < ApplicationController
               before_action :is_admin?

               def index
                 @users = User.all
                 json_response(@users)
               end

               def show
                 @user = User.find(:user_id[])
               end

               def update end

               def destroy; end
             end
end
