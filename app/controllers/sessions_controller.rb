class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to user_path(user)
    else
      flash[:alert] = "This name/password is invalid."
      redirect_to new_session_path
    end
  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_user_path
  end
end
