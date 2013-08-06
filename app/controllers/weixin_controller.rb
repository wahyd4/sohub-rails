require 'weixin_service'

class WeixinController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:query]

  include WeixinService

  def verify
    echo_str = params[:echostr]
    render text: echo_str
  end

  def query
    Rails.logger.info "[3]===="+ params[:xml].to_s
    message = parse_xml_to_hash params[:xml]
    case message.message_type
      when 'text'
        content = "Hello Forkers!";
      when 'image'
        content = "Image"
      else
        content = "对不起，你发的消息我不能分辨"
    end
    result = reply_text_message message, content
    Rails.logger.info "result===" +result.to_s
    render xml: result
  end

end
