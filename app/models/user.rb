class User < ActiveRecord::Base
  has_many :messages
  has_many :hubs
  has_many :user_to_sohub_modules
  has_many :sohub_modules, through: :user_to_sohub_modules
  belongs_to :image
  attr_accessor :front_end_display_name

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"].to_s
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
      update_attributes avatar: avatar_image.image.source.url(:thumb)
      true
    else
      false
    end
  end

  def image_messages
    self.messages.where(message_type: 'image')
  end

  def set_current_hub(hub_id)
    if Hub.find_by_id hub_id
      update_attributes current_hub_id: hub_id
    else
      false
    end
  end

end