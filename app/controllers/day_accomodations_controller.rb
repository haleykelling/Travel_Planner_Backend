class DayAccomodationsController < ApplicationController
    def index
        @day_accomodations = DayAccomodation.all 
        render json: @day_accomodations
    end
    
    def create
        @day_accomodation = DayAccomodation.create(day_id: params[:day_id], accomodation_id: params[:accomodation_id])

        render json: @day_accomodation
    end
end
