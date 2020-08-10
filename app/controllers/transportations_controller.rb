class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :update, :destroy]

  # GET /transportations
  def index
    @transportations = Transportation.all

    render json: @transportations
  end

  # GET /transportations/1
  def show
    render json: @transportation
  end

  # POST /transportations
  def create
    @transportation = Transportation.new(transportation_params)

    if @transportation.save
      render json: @transportation, status: :created, location: @transportation
    else
      render json: @transportation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transportations/1
  def update
    if @transportation.update(transportation_params)
      render json: @transportation
    else
      render json: @transportation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transportations/1
  def destroy
    @transportation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transportation
      @transportation = Transportation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transportation_params
      params.require(:transportation).permit(:name, :details, :type_of_activity, :address, :start_time, :end_time, :multiday)
    end
end
