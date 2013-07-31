class AdminController < ApplicationController
  before_filter :authenticate


  def index
    @weibo = Credential.where(oauth_provider: 'weibo').last
  end
end
