class Park < ApplicationRecord
  has_many :meetups

  validates :name, :latitude, :longitude, presence: true
end
