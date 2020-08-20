class Day < ApplicationRecord
  belongs_to :trip

  has_many :activities, dependent: :destroy
  has_many :day_transportations, dependent: :destroy
  has_many :transportations, through: :day_transportations
  has_many :day_accomodations, dependent: :destroy
  has_many :accomodations, through: :day_accomodations
  has_many :comments, dependent: :destroy

  def check_if_coordinates_need_updated(params)
    update_start_coordinates = params[:start_city] != self.start_city
    update_end_coordinates = params[:end_city] != self.end_city

    if update_start_coordinates && update_end_coordinates
      start_response = GoogleGeocodingService.new(params[:start_city]).get_coordinates
      end_response = GoogleGeocodingService.new(params[:end_city]).get_coordinates

      start_latitude = start_response["results"][0]["geometry"]["location"]["lat"]
      start_longitude = start_response["results"][0]["geometry"]["location"]["lng"]

      end_latitude = end_response["results"][0]["geometry"]["location"]["lat"]
      end_longitude = end_response["results"][0]["geometry"]["location"]["lng"]

      new_params = params.merge(
        start_latitude: start_latitude, 
        start_longitude: start_longitude,
        end_latitude: end_latitude,
        end_longitude: end_longitude
      )
      return new_params
    elsif update_start_coordinates
      response = GoogleGeocodingService.new(params[:start_city]).get_coordinates
      latitude = response["results"][0]["geometry"]["location"]["lat"]
      longitude = response["results"][0]["geometry"]["location"]["lng"]
      new_params = params.merge(start_latitude: latitude, start_longitude: longitude)
      return new_params
    elsif update_end_coordinates
      response = GoogleGeocodingService.new(params[:end_city]).get_coordinates
      latitude = response["results"][0]["geometry"]["location"]["lat"]
      longitude = response["results"][0]["geometry"]["location"]["lng"]
      new_params = params.merge(end_latitude: latitude, end_longitude: longitude)
      return new_params
    end
    return params
  end
  
end
