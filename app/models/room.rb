# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  has_many :messages, dependent: :destroy

  validates :creator_id, uniqueness: { scope: :recipient_id }


  scope :own_room, ->(user_id) { where("creator_id = ? OR recipient_id = ?", user_id, user_id) }

  def recipient_for(user)
    if creator?(user)
      return recipient
    end
    creator
  end

  private

  def creator?(user)
    user == creator
  end
end
