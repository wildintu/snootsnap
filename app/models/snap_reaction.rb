class SnapReaction < ApplicationRecord
  belongs_to :user
  belongs_to :snap

  validates :emoji, presence: true
  validates :user_id, uniqueness: { scope: :snap_id, message: "can react only once per snap" }
end
