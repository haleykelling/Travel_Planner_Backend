class DaysController < ApplicationController
  before_action :set_day, only: [:update]

  def index
    @days = Day.where(trip_id: params[:trip_id])

    render json: @days, include: [:activities, :transportations, :accomodations, :comments]
  end

  def update
    new_params = @day.check_if_coordinates_need_updated(day_params)
    if @day.update(new_params)
      render json: @day, include: [:activities, :transportations, :comments]
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  private

    def set_day
      @day = Day.find(params[:id])
    end

    def day_params
      params.require(:day).permit(
        :id,  
        :date, 
        :start_city, 
        :end_city, 
        :trip_id, 
        :start_latitude, 
        :start_longitude, 
        :end_latitude, 
        :end_longitude
      )
    end
end
