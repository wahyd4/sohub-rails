require 'oauth_utils'
class SessionsController < ApplicationController
  include OauthUtils

  def new
  end

  def create
    if params[:provider] =='weibo' && env["omniauth.auth"]["uid"]==1241296550
      token =env["omniauth.auth"]["credentials"]["token"]
      weibo_util token
      render text: '更新微博token成功'
      return
    end
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in!"
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

  def google
    Rails.logger.info "======"+ env["omniauth.auth"].to_s
  end

end
