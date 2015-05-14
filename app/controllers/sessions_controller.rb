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
    Session.find_by(session_token: session[:session_token]).destroy
    @current_user = nil
    session[:session_token] = nil
    redirect_to cats_url
  end
end
