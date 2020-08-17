class Activity < ApplicationRecord
  belongs_to :day

  validates :name, :address, :start_time, :latitude, :longitude, presence: true

end
