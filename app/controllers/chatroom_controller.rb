# frozen_string_literal: true

class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @users = User.all
    # render :index, locals: { messages: Message.order('created_at ASC').includes(:user) }
    render :index, locals: { messages: Message.includes(:user).custom_display }
  end
end
