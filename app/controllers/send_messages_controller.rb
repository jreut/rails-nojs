class SendMessagesController < ApplicationController
  before_action :set_user

  def create
    message = Message.create create_params.merge(
      user: @current_user
    )
    redirect_to chat_path(message.conversation)
  end

  private

  def create_params
    @create_params ||= params.require(:message).permit(
      :conversation_id,
      :content
    )
  end

  def set_user
    @current_user = User.find session[:user_id]
  end
end
