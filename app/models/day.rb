class Day < ApplicationRecord
  belongs_to :trip

  has_many :activities
  has_many :day_transportations
  has_many :transportations, through: :day_transportations
end
