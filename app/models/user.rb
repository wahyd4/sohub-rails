class User < ActiveRecord::Base
  has_many :messages
  has_many :hubs
  attr_accessor :front_end_display_name

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def self.user_with_weixin_id(weixin_user_id)
    user = User.find_by_weixin_user_id weixin_user_id
    if user
      user
    else
      user = User.create weixin_user_id: weixin_user_id
    end
  end

  def set_display_name(name)
    update_attributes display_name: name
  end

  def front_end_display_name
    self.display_name == nil ? I18n.t('user.defaultName') : self.display_name
  end

  def set_avatar
    avatar_image = image_messages.last
    if avatar_image
      update_attributes avatar: avatar_image.picture_url
      avatar_image.destroy!
      true
    else
      false
    end
  end

  def image_messages
    self.messages.where(message_type: 'image')
  end

end