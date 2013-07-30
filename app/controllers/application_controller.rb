class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "sohub" && password == "@sohub"
    end
  end

  def login_required
    unless current_user
      redirect_to login_url
    end
  end
end
