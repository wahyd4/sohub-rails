class Credential < ActiveRecord::Base

  def self.weibo_token
    credential = Credential.where(oauth_provider: 'weibo').last
    credential ? credential.token : nil
  end

  def self.google_token
    credential = Credential.where(oauth_provider: 'google').last
    credential ? credential.token : nil
  end

  def self.google_refresh_token
    Credential.where("oauth_provider = ? AND refresh_token != ''", 'google').last.refresh_token
  end

  def self.create_google_credential(token, refresh_token)
    Credential.create token: token, refresh_token: refresh_token, oauth_provider: 'google'
  end

  def self.create_weibo_credential(token)
    Credential.create token: token, refresh_token: nil, oauth_provider: 'weibo'
  end

  def self.update_google_token(new_token)
    credential = Credential.where("oauth_provider = ? AND refresh_token != ''", 'google').last
    credential.token = new_token
    credential.save
    credential
  end
end
