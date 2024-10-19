# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  has_many :messages, dependent: :destroy

  validates :creator_id, uniqueness: { scope: :recipient_id }

  before_validation :normalize_user_order

  scope :own_room, ->(user_id) { where("creator_id = ? OR recipient_id = ?", user_id, user_id) }

  def recipient_for(user)
    if creator?(user)
      creator
    end
    recipient
  end

  private

  def creator?(user)
    user == creator
  end

  def normalize_user_order
    if creator_id > recipient_id
      self.creator_id, self.recipient_id = recipient_id, creator_id
    end
  end
end
