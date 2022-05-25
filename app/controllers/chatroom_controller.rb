class ChatroomController < ApplicationController

  def index
    render :index, locals: { messages: Message.order('created_at ASC').includes(:user) }
  end
end
