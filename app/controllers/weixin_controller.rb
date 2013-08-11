require 'weixin'

class WeixinController < ApplicationController

  include Weixin

  skip_before_filter :verify_authenticity_token, :only => [:query]

  def verify
    echo_str = params[:echostr]
    render text: echo_str
  end

  def query
    Rails.logger.info "[xml]===="+ params[:xml].to_s
    message = parse_xml_to_hash params[:xml]
    weixin_service = WeixinService.new
    case message.message_type
      when 'text'
        content = weixin_service.handle_text message
      when 'image'
        content = I18n.t('weixin.success.image')
      else
        content = I18n.t('weixin.success.unknown')
    end
    response_message = message.dup
    message.store_message
    result = reply_text_message response_message, content
    Rails.logger.info "Sending result=======" + result.to_s
    render xml: result
  end

end
