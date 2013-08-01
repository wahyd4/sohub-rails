module OauthUtils

  def refresh_token
    options = {
        body: {
            client_id: ENV["GOOGLE_KEY"],
            client_secret: ENV["GOOGLE_SECRET"],
            refresh_token: Credential.google_refresh_token,
            grant_type: "refresh_token"
        },
        headers: {
            "Content-Type" => "application/x-www-form-urlencoded"
        }
    }
    refresh = HTTParty.post("https://accounts.google.com/o/oauth2/token", options)
    if refresh.code == 200
      token = refresh.parsed_response['access_token']
      Credential.update_google_token token
    else
      Rails.logger.error "ERROR:"+ refresh.to_s
      raise Exception
    end
  end

end
