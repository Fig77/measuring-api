class MeasureItemsController < ApplicationController
  before_action :set_measure, only: [:show]

  def index
    @measures = MeasureItem.all
    json_response(@measures)
  end

  def show
    json_response(@measure)
  end

  private

  def measure_params
    params.permit(:name, :description)
  end

  def set_measure
    @measure = MeasureItem.find(params[:id])
  end
end
