class DayTransportationsController < ApplicationController
    def create
        @day_transportation = DayTransportation.create(day_id: params[:day_id], transportation_id: params[:transportation_id])

        render json: @day_transportation
    end

end
