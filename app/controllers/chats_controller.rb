class ChatsController < ApplicationController
  before_action :set_user
  before_action :set_chat, only: %i[show]

  def index
    @chats = @current_user.conversations.uniq
  end

  def create
    chat = Conversation.create
    redirect_to :show, id: chat.id
  end

  def show
    @new_message = Message.new conversation: @chat
  end

  private

  def set_user
    @current_user = User.find session[:user_id]
  rescue ActiveRecord::RecordNotFound
    redirect_to new_session_path
  end

  def set_chat
    @chat = Conversation.find params[:id]
  end
end
