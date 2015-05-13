class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    user = User.find_by(session_token: session[:session_token])
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def log_in(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end
end
