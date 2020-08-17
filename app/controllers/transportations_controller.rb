class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :update, :destroy]

  def index
    @transportations = Transportation.all

    render json: @transportations
  end

  def create
    response = GoogleGeocodingService.new(activity_params[:address]).get_coordinates
    latitude = response["results"][0]["geometry"]["location"]["lat"]
    longitude = response["results"][0]["geometry"]["location"]["lng"]

    @transportation = Transportation.new(transportation_params.merge(latitude: latitude, longitude: longitude))

    if @transportation.save
      render json: @transportation, status: :created, location: @transportation
    else
      render json: {error: "Must fill out all fields and have valid address"}, status: :unprocessable_entity
    end
  end

  def destroy
    @day_transportation = DayTransportation.find_by(transportation_id: params[:id])
    @day_transportation.destroy
    @transportation.destroy
  end

  private
    def set_transportation
      @transportation = Transportation.find(params[:id])
    end

    def transportation_params
      params.require(:transportation).permit(:name, :details, :type_of_activity, :address, :start_time, :end_time, :multiday)
    end
end
