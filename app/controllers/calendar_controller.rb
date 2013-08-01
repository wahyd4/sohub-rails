require 'oauth_utils'
class CalendarController < ApplicationController

  caches_action :index, expires_in: 15.minutes
  include OauthUtils

  def index
    token = Credential.google_token
    url ='https://www.googleapis.com/calendar/v3/calendars/wahyd4@gmail.com/events'

    RestClient.get(url, {params: {access_token: token}}) { |response, request, result, &block|
      case response.code
        when 200
          render json: response.to_s
        when 401
          refresh_token
          redirect_to calendar_path
        else
          response.return!(request, result, &block)
      end
    }
  end

end
