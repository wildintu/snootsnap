class Dog < ApplicationRecord
  belongs_to :user
  has_many :snaps, through: :user

  validates :name, :breed, :size, :energy_level, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :temperament, inclusion: { in: ['friendly', 'shy', 'aggressive'] }, allow_nil: true
end
