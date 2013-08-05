require 'weixin_service'

class WeixinController < ApplicationController

  include WeixinService

  def verify
    echo_str = params[:echostr]
    render text: echo_str
  end

  def query
    message = parse_xml_to_hash(params[:xml])
    case message.message_type
      when 'text'
        reply_text_message message, "Hello Forkers!"
      when 'image'
        reply_text_message message, "Image"
      else
        reply_text_message message, "对不起，你发的消息我不能分辨"
    end
  end

end
