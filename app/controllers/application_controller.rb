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
    session_details = get_session_details
    new_session = Session.create(user_id: user.id, details: session_details)
    session[:session_token] = new_session.session_token
  end

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end

  private

  def get_session_details
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    browser = user_agent.browser
    platform = user_agent.platform
    city = request.location.city
    [browser, platform, city].join('$')
  end
end
