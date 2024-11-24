# frozen_string_literal: true

class MessagesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @message = Message.new(room: @room, user: current_user)
  end

  def create
    @message = Message.new(save_params)
    if @message.save
      flash[:success] = "Message sent!"
      # redirect_to room_path(@message.room)
    else
      # flash[:error] = @message.errors.full_messages.join(", ")
      # redirect_to new_room_message_path(@message.room)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(save_params)
      redirect_to room_path(@message.room)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def save_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end
end
