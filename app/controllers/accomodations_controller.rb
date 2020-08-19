class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: [:show, :update, :destroy]

  def index
    @accomodations = Accomodation.all

    render json: @accomodations
  end

  def create
    response = GoogleGeocodingService.new(params[:address]).get_coordinates
    latitude = response["results"][0]["geometry"]["location"]["lat"]
    longitude = response["results"][0]["geometry"]["location"]["lng"]
    
    @accomodation = Accomodation.new(latitude: latitude, longitude: longitude, name: params[:name], address: params[:address])

    if @accomodation.save
      @accomodation.create_day_accomodations(params[:day_ids])
      render json: @accomodation, status: :created, location: @accomodation
    else
      render json: {error: "Unable to process--please make sure you have filled out all fields and have included a valid address"}, status: :unprocessable_entity
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

end
