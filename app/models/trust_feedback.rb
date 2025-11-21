class TrustFeedback < ApplicationRecord
  belongs_to :user
  belongs_to :meetup

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 300 }, allow_blank: true
end
