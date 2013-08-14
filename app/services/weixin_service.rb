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
    elsif is_set_avatar content
      is_success = message.user.set_avatar
      result = is_success ? I18n.t('weixin.success.setAvatar') : I18n.t('weixin.failed.setAvatar')
    elsif is_set_current_hub content
      current_hub = get_current_hub content
      is_success = message.user.set_current_hub current_hub
      result = is_success ? I18n.t('weixin.success.setHub') : I18n.t('weixin.failed.setHub')
    elsif is_set_name content
      result = set_user_display_name message
    elsif (message.hub_id == nil && message.is_need_to_store)
      result =I18n.t('weixin.warn.setHub')
    elsif is_normal_message(content)
      result = I18n.t('weixin.success.text')
    elsif is_notice(content)
      message.to_notice!
      result = I18n.t('weixin.success.notice')
    else
      result = I18n.t('weixin.dirty')
    end
  end

  def set_user_display_name(message)
    message.set_user_name
    I18n.t('weixin.success.setName')
  end

end