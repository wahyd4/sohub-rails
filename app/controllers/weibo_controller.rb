require 'rest_client'

class WeiboController < ApplicationController

  def index
    token =Credential.weibo_token
    url = 'https://api.weibo.com/2/statuses/friends_timeline.json'
    RestClient.get(url, {params: {access_token: token}}) { |response, request, result, &block|
      case response.code
        when 200

          render json: response
        when 423
          raise SomeCustomExceptionIfYouWant
        else
          response.return!(request, result, &block)
      end
    }
  end

end
