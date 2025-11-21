class Snap < ApplicationRecord
  belongs_to :user
  belongs_to :meetup, optional: true
  has_many :snap_reactions

  validates :media, presence: true
  validates :expires_at, presence: true
end
