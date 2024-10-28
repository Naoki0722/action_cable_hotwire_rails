# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  def own_message?(current_user)
    user == current_user
  end
end
