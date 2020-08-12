class Activity < ApplicationRecord
  belongs_to :day

  validates :name, :address, :start_time, presence: true
end
