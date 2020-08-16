class GoogleGeocodingService
    def initialize location
        @location = location
    end

    def get_coordinates
        params = URI.encode(@location)
        response = Excon.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params}&key=#{ENV['GEOCODE_KEY']}", {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }   
        })
        JSON.parse(response.body)
    end
end