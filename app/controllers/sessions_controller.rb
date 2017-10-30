class SessionsController < ApplicationController
  def new
    @users = User.first 10
  end

  def create
    session[:user_id] = create_params[:user_id]
    redirect_to chats_path
  end

  def destroy
    reset_session
    redirect_to :new_session
  end

  private

  def create_params
    params.permit(
      :user_id
    )
  end
end
