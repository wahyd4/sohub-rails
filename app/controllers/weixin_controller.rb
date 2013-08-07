require 'weixin'

class WeixinController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:query]

  def verify
    echo_str = params[:echostr]
    render text: echo_str
  end

  def query
    Rails.logger.info "[3]===="+ params[:xml].to_s
    message = parse_xml_to_hash params[:xml]
    weixin_service = WeixinService.new
    case message.message_type
      when 'text'
        content = weixin_service.handle_text message.content
      when 'image'
        content = I18n.t('weixin.success.image')
      else
        content = I18n.t('weixin.success.unknown')
    end
    result = reply_text_message message, content
    render xml: result
  end

end
