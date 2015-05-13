class UsersController < ApplicationController
  before_action :redirect_if_logged_in

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to cats_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end
end
