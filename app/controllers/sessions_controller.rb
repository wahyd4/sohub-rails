require 'oauth_utils'
class SessionsController < ApplicationController
  include OauthUtils

  def new
  end

  def create
    Rails.logger.warn "===========" + env["omniauth.auth"].to_s

    if params[:provider] =='weibo' && env["omniauth.auth"]["uid"]==3687629193
      token =env["omniauth.auth"]["credentials"]["token"]
      Credential.create_weibo_credential token
      render text: '更新微博token成功'
      return
    elsif env["omniauth.auth"]["uid"]=="111750382914822658237"
      token =env["omniauth.auth"]["credentials"]["token"]
      refresh_token =env["omniauth.auth"]["credentials"]["refresh_token"]
      Credential.create_google_credential token, refresh_token
      render text: '更新google token成功'
      return
    end

    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: I18n.t('auth.login_success')
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to :back, alert: I18n.t('auth.login_failed')
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  def signup
    @identity = env['omniauth.identity']
  end

end
