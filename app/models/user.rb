class User < ApplicationRecord
  has_many :dogs
  has_many :meetups, foreign_key: :organizer_id
  has_many :meetup_attendances
  has_many :snaps
  has_many :snap_reactions
  has_many :trust_feedbacks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :latitude, :longitude, presence: true
end
