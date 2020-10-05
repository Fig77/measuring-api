class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]

  def index
    @measurements = Measurement.all
    json_response(@measurements)
  end

  def new; end

  def show
    json_response(@measurement)
  end

  def create; end

  def update; end

  def destroy; end

  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end
end
