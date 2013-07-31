class Credential < ActiveRecord::Base

  def self.weibo_token
    Credential.where(oauth_provider: 'weibo').last.token
  end

end
