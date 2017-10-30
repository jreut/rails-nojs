class SendMessagesController < ApplicationController
  def create
    # TODO: use a session!
    message = Message.new user: User.first
    message.update create_params
    message.save
    redirect_to chat_path(message.conversation)
  end

  private

  def create_params
    @create_params ||= params.require(:message).permit(
      :conversation_id,
      :content
    )
  end
end
