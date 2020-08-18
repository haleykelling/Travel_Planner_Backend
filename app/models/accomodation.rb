class Accomodation < ApplicationRecord
    has_many :day_accomodations
    has_many :days, through: :day_accomodations

end
