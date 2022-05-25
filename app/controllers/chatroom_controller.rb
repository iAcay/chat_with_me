class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    render :index, locals: { messages: Message.order('created_at ASC').includes(:user) }
  end
end
