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
      create_days
      render json: @trip, include: :days, status: :created, location: @trip
    else
      render json: {error: "Must have a name to create trip. You can always edit this later."}, status: :unprocessable_entity
    end

  end

  def update
    @trip.edit_days(trip_params[:start_date], trip_params[:end_date])
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

  def create_days
    number_of_days = (@trip.end_date - @trip.start_date).to_i + 1
    n = 0
    while n < number_of_days
      Day.create(date: (@trip.start_date + n), trip: @trip)
      n+=1
    end
  end

end
