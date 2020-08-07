class Day < ApplicationRecord
  belongs_to :trip

  has_many :transportations, :activities, :restaurants
end
