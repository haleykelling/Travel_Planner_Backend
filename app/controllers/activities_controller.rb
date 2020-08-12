class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  def index
    @activities = Activity.all

    render json: @activities
  end

  def show
    render json: @activity
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
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
