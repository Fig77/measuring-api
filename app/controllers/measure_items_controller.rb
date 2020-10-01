class MeasureItemsController < ApplicationController
  def index
    @meaures = MeasureItem.all
    json_response(@meaures)
  end

  def show; end
end
