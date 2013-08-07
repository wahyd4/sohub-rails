require 'weixin/text_util'

class WeixinService

  def handle_text(content)
    result = nil
    if is_help(content)
      result = I18n.t('weixin.help')
    elsif is_menu(content)
      result = I18n.t('weixin.menu')
    elsif is_normal_message(content)
      result = I18n.t('weixin.success.text')
    elsif is_notice(content)
      result = I18n.t('weixin.success.text')
    else
      result = I18n.t('weixin.dirty')
    end
  end
end