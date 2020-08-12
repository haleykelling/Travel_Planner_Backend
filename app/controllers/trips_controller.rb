class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    @trips = Trip.all

    render json: @trips, include: :days
  end

  def show
    render json: @trip
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      @trip.create_days
      render json: @trip, include: :days, status: :created, location: @trip
    else
      render json: {error: "Must have a name to create trip. You can always edit this later."}, status: :unprocessable_entity
    end

  end

  def update
    @trip.edit_days(trip_params[:start_date], trip_params[:end_date])
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      render json: @trip, include: :days
    else
      render json: {error: "Unable to edit this trip. Please ensure you have a valid start and end date."}, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.days.destroy_all
    @trip.destroy
  end
  
  private
  
  def set_trip
    @trip = Trip.find(params[:id])
  end
  
  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end

end
