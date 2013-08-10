require 'weixin/text_util'

class Message < ActiveRecord::Base
  belongs_to :user

  include TextUtil

  def is_need_to_store
    if message_type == 'image' || is_normal_message(content)||is_notice(content)
      true
    else
      false
    end
  end

  def to_notice
    self.message_type = 'notice'
  end

  def store_message
    if self.is_need_to_store
      self.save
      self
    else
      nil
    end
  end

end