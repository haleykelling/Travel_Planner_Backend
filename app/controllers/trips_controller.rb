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
    @trip = Trip.new(set_new_params)

    if @trip.save
      create_days
      render json: @trip, status: :created, location: @trip
    else
      render json: {error: "Must have either a number of days or a start and end date to create a new trip.You can always edit this later."}, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
  end

  def create_days
    if trip.start_date && trip.end_date
      n = 0
      while n < trip.number_of_days
        Day.create(number: (n + 1), date: (start_date + n), trip: @trip)
        n+=1
      end
    else 
      n = 0
      while n < trip.number_of_days
        Day.create(number: (n + 1), trip: @trip)
        n+=1
      end
    end
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :number_of_days)
    end

    def set_new_params
      if trip_params.start_date && trip_params.number_days
        end_date = trip_params.start_date + (trip_params.number_days - 1)
        new_params = trip_params.merge(end_date: end_date)
        return new_params
      elsif trip_params.end_date && trip_params.number_days
        start_date = trip_params.end_date - (trip_params.number_days - 1)
        new_params = trip_params.merge(start_date: start_date)
        return new_params
      elsif trip_params.number_of_days
        return trip_params
      elsif trip_params.start_date && trip_params.end_date
        number_days = (trip_params.end_date - trip_params.start_date).to_i + 1
        new_params = trip_params.merge(number_of_days: number_days)
        return new_params
      end
    end
end
