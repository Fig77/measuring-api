class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]

  def index
    @measurements = Measurement.all
    json_response(@measurements)
  end

  def show
    json_response(@measurement)
  end

  def create
    @measurement = current_user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end

  def update; end

  def destroy; end

  private

  def measurement_params
    params.permit(:value, :comment, :measure_item_id)
  end

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end
end
