module V1
 class MeasureItemsController < ApplicationController
   before_action :measure_item, only: [:show]

   def index
     @measure_items = MeasureItem.all
     json_response(@measure_items)
   end

   def show
     json_response(@measure_item)
   end

   private

   def measure_item
     @measure_item ||= MeasureItem.find(params[:id])
   end
 end
end
