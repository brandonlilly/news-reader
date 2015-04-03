class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    username, password = params[:user][:username], params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      log_in_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ['Invalid login']
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    redirect_to new_session_url
  end

end
