class SessionsController < ApplicationController
  #before_action :redirect_if_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user_name], user_params[:password])
    if @user.nil?
      @user = User.new
      render :new
    else
      log_in(@user)
      redirect_to cats_url
    end
  end

  def destroy
    @user = current_user
    session[:session_token] = nil
    @user.reset_session_token!
    redirect_to cats_url
  end


end
