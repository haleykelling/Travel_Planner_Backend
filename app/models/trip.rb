class Trip < ApplicationRecord
    has_many :days

    validates :number_of_days, presence: true
end
