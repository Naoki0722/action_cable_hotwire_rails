# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :sent_rooms, class_name: "Room", foreign_key: "creator_id"
  has_many :received_rooms, class_name: "Room", foreign_key: "recipient_id"
end
