require 'weixin/text_util'

class Message < ActiveRecord::Base
  belongs_to :user

  include TextUtil

  delegate :front_end_display_name, to: :user
  scope :reverted, -> { order('created_at DESC') }

  after_create :fill_from_user

  def is_need_to_store
    if hub_id && (message_type == 'image' || is_valid_text_message)
      true
    else
      false
    end
  end

  def is_valid_text_message
    message_type == 'text' && (is_normal_message(content)||is_notice(content))
  end

  def to_notice!
    self.message_type = 'notice'
  end

  def store_message
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

  def fill_from_user
    update_attributes! from_user: self.front_end_display_name
  end

end