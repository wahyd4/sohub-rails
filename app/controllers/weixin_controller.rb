require 'weixin_service'

class WeixinController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:query]

  include WeixinService

  def verify
    echo_str = params[:echostr]
    render text: echo_str
  end

  def query
    Rails.logger.info "[3]===="+ request.request_parameters.to_s
    weixin_params= request.request_parameters
    message = parse_xml_to_hash(weixin_params[:xml])
    case message.message_type
      when 'text'
        result = reply_text_message message, "Hello Forkers!"
      when 'image'
        result = reply_text_message message, "Image"
      else
        result = reply_text_message message, "对不起，你发的消息我不能分辨"
    end
    render xml: result
  end

end
