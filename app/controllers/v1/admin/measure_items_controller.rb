module V1
  module Admin
    class MeasureItemsController < ApplicationController
      before_action :admin?
      before_action :measure_item, only: %i[show update destroy]
      def index
        @measure_items = MeasureItem.all
        json_response(@measure_items)
      end

      def create
        @measure_item = MeasureItem.create!(measure_item_params)
        json_response(@measure_item, :created)
      end

      def show
        json_response(@measure_item)
      end

      def update
        @measure_item.update!(measure_item_params)
        head :no_content
      end

      def destroy
        @measure_item.destroy
        head :no_content
      end

      private

      def measure_item_params
        params.permit(:name, :description)
      end

      def measure_item
        @measure_item ||= MeasureItem.find(params[:id])
      end

      def admin?
        return current_user if current_user.role.admin === true # rubocop:disable Style/CaseEquality

        raise(ExceptionHandler::PermissionDenied, 'Forbidden')
      end
    end
  end
end
