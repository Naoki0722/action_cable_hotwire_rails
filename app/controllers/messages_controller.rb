# frozen_string_literal: true

class MessagesController < ApplicationController
  def new
    p params[:room_id]
    @message = Message.new
  end

  def create
    p params[:room_id]
    p create_params
  end

  private

  def create_params
    params.require(:message).permit(:content)
  end
end
