# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.own_room(current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(creator_id: current_user.id, recipient_id: room_params[:recipient])
    if @room.save
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:recipient)
  end
end
