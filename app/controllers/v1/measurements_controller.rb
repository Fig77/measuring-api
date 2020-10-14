module V1
  class MeasurementsController < ApplicationController
    before_action :set_measurement, only: %i[show update destroy]
    before_action :set_todays, only: :index

    def index
      if @todays
        json_response(@todays)
      else
        @measurements = current_user.measurements.all
        json_response(@measurements)
      end
    end

    def create
      @measurement = current_user.measurements.create!(measurement_params)
      json_response(@measurement, :created)
    end

    def show
      json_response(@measurement)
    end

    def update
      @measurement.update(measurement_params)
      head :no_content
    end

    def destroy
      @measurement.destroy
      head :no_content
    end

    private

    def measurement_params
      params.permit(:value, :comment, :measure_item_id, :date)
    end

    def set_measurement
      @measurement = current_user.measurements.find(params[:id])
    end

    def set_todays
      @todays ||= current_user.measurements.today if params[:today]
    end
  end
end
