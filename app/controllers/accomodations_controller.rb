class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: [:show, :update, :destroy]

  def index
    @accomodations = Accomodation.all

    render json: @accomodations
  end

  def create
    response = GoogleGeocodingService.new(accomodation_params[:address]).get_coordinates
    latitude = response["results"][0]["geometry"]["location"]["lat"]
    longitude = response["results"][0]["geometry"]["location"]["lng"]
    
    @accomodation = Accomodation.new(accomodation_params.merge(latitude: latitude, longitude: longitude))

    if @accomodation.save
      render json: @accomodation, status: :created, location: @accomodation
    else
      render json: @accomodation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @day_accomodations = DayAccomodation.where(accomodation_id: params[:id])
    @day_accomodations.each do |day_accomodation|
      day_accomodation.destroy
    end
    @accomodation.destroy
  end

  private

    def set_accomodation
      @accomodation = Accomodation.find(params[:id])
    end

    def accomodation_params
      params.require(:accomodation).permit(:name, :address, :latitude, :longitude)
    end
end
