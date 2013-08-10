require 'weixin/text_util'

class WeixinService

  include TextUtil

  def handle_text(message)
    content = message.content
    result = nil
    if is_help(content)
      result = I18n.t('weixin.help')
    elsif is_menu(content)
      result = I18n.t('weixin.menu')
    elsif is_normal_message(content)
      result = I18n.t('weixin.success.text')
    elsif is_notice(content)
      message.to_notice
      result = I18n.t('weixin.success.notice')
    else
      result = I18n.t('weixin.dirty')
    end
  end

end