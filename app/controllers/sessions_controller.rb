class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to sohub_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to :root, alert: "Authentication failed, please try again."
  end

  def signup
    @identity = env['omniauth.identity']
  end

  def weibo
    hash = env["omniauth.auth"]
    weibo_key = hash["credentials"]["token"]
    render text: weibo_key
  end

  def google
    Rails.logger.info "======"+ env["omniauth.auth"].to_s
  end

end
