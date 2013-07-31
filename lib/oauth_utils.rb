module OauthUtils

  def weibo_util(token)
    @credential = Credential.create token: token, oauth_provider: 'weibo'
  end

end
