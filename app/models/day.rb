class Day < ApplicationRecord
  belongs_to :trip

  has_many :transportations
  has_many :activities
  has_many :restaurants
end
