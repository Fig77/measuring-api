module Admin
  class MeasureItemsController < ApplicationController
    before_action :admin?
    def index; end

    def new; end

    def create; end

    def show; end

    def update; end

    def destroy; end

    private

    def admin?
      return current_user if current_user.admin === true

      raise(ExceptionHandler::PermissionDenied, 'Forbbiden')
    end
  end
end
