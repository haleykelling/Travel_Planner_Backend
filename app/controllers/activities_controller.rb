class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  def index
    @activities = Activity.all

    render json: @activities
  end

  def create
    response = GoogleGeocodingService.new(activity_params[:address]).get_coordinates
    latitude = response["results"][0]["geometry"]["location"]["lat"]
    longitude = response["results"][0]["geometry"]["location"]["lng"]
    
    @activity = Activity.new(activity_params.merge(latitude: latitude, longitude: longitude))

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: {error: "Unable to process--please make sure you have filled out all fields and have included a valid address"}, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
  end

  private

  def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :details, :address, :type_of_activity, :start_time, :end_time, :day_id)
    end
end
