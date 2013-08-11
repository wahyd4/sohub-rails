require 'weixin/text_util'

class Message < ActiveRecord::Base
  belongs_to :user

  include TextUtil

  delegate :front_end_display_name, to: :user

  def is_need_to_store
    if message_type == 'image' || is_normal_message(content)||is_notice(content)
      true
    else
      false
    end
  end

  def to_notice!
    self.message_type = 'notice'
  end

  def store_message
    self.from_user= self.front_end_display_name
    if self.is_need_to_store
      replace_symbol! self.content
      self.save
      self
    else
      nil
    end
  end

  def set_user_name
    self.content.gsub!(/[=]/, '')
    user = User.find_by_id self.user_id
    user.set_display_name self.content
  end
end