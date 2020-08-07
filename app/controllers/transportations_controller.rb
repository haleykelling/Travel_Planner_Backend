class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :update, :destroy]

  def index
    @transportations = Transportation.all

    render json: @transportations
  end

  def show
    render json: @transportation
  end

  def create
    @transportation = Transportation.new(transportation_params)

    if @transportation.save
      render json: @transportation, status: :created, location: @transportation
    else
      render json: @transportation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transportation.update(transportation_params)
      render json: @transportation
    else
      render json: @transportation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transportation.destroy
  end

  private

  def set_transportation
      @transportation = Transportation.find(params[:id])
    end

    def transportation_params
      params.require(:transportation).permit(:name, :description, :address, :start_time, :end_time, :day_id)
    end
end
