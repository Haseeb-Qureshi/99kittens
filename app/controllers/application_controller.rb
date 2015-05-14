class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
     current_session = Session.includes(:user)
        .find_by(session_token: session[:session_token])
     @current_user = current_session.user unless current_session.nil?
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def log_in(user)
    session[:session_token] = Session.create(user_id: user.id).session_token
  end

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end
end
