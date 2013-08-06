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
        content = I18n.t('weixin.success.text')
      when 'image'
        content = I18n.t('weixin.success.image')
      else
        content = I18n.t('weixin.success.unknown')
    end
    result = reply_text_message message, content
    render xml: result
  end

end
