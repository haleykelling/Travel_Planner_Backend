class Accomodation < ApplicationRecord
    has_many :day_accomodations
    has_many :days, through: :day_accomodations

    def create_day_accomodations(day_ids)
        day_ids.each do |key, value|
            DayAccomodation.create(accomodation_id: self.id, day_id: value)
        end
    end
end
