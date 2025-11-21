class Meetup < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :meetup_attendances
  has_many :attendees, through: :meetup_attendances, source: :user
  has_many :snaps
  has_many :trust_feedbacks

  validates :title, :start_time, :end_time, :latitude, :longitude, presence: true
  validate :end_after_start

  private

  def end_after_start
    return if end_time.blank? || start_time.blank?
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end
