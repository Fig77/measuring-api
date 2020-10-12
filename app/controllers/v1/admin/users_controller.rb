module V1
  module Admin
    class UsersController < ApplicationController
      before_action :admin?

      def index; end

      def create; end

      def show; end

      def update; end

      def destroy; end

      private

      def admin?
        return current_user if current_user.role.admin === true

        raise(ExceptionHandler::PermissionDenied, 'Forbidden')
      end
    end
  end
end
