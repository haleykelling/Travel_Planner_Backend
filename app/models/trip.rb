class Trip < ApplicationRecord
    has_many :days

    validates :name, :start_date, :end_date, presence: true
end
