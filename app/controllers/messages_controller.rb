# frozen_string_literal: true

class MessagesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @message = Message.new(room: @room, user: current_user)
  end

  def create
    p create_params[:user_id]
    message = Message.new(create_params)
    if message.save
      flash[:success] = "Message sent!"
      redirect_to room_path(message.room)
    else
      flash[:error] = message.errors.full_messages.join(", ")
      redirect_to new_room_message_path(message.room)
    end
  end

  private

  def create_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end
end
