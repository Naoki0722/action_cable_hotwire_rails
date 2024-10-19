# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :recipient, class_name: "User"
  has_many :messages, dependent: :destroy
end
