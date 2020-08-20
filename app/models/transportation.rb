class Transportation < ApplicationRecord

    has_many :day_transportations, dependent: :destroy
    has_many :days, through: :day_transportations

    validates :name, :address, :start_time, :latitude, :longitude, presence: true

end
