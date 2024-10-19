# frozen_string_literal: true

class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
  end
end
