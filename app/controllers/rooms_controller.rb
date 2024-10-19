# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.own_room(current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end
end
