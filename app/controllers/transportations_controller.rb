class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :update, :destroy]

  def index
    @transportations = Transportation.all

    render json: @transportations
  end

  def create
    response = GoogleGeocodingService.new(transportation_params[:address]).get_coordinates
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
    @day_transportations = DayTransportation.where(transportation_id: params[:id])
    @day_transportations.each do |day_transportation|
      day_transportation.destroy
    end
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
