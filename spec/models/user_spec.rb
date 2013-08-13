require 'spec_helper'

describe User do

  it 'should return the i18n words' do
    I18n.t('hello').should == '你好'
  end

  describe 'get user from weixin user id' do
    it 'should return a user created with weixin user id' do

      lambda do
        user = User.user_with_weixin_id 'dsfsnjsdf34534'
        user.weixin_user_id.should == 'dsfsnjsdf34534'
      end.should change(User, :count).by(1)
    end
  end
  describe 'should set user display name' do
    it 'should set user display name success' do
      user = User.user_with_weixin_id 'dsfsnjsdf34534'
      user.set_display_name 'QQ'
      user.display_name.should == 'QQ'
      User.find_by_display_name('QQ').should_not == nil
    end

  end

  describe 'get user display name' do
    it 'should get a user display name for a user who has been set display name' do
      user = User.create(weixin_user_id: '4r345sdf', display_name: 'Tom')
      name = user.front_end_display_name
      name.should == 'Tom'
    end

    it 'should return default display name for a user who did not set display name' do
      user = User.create(weixin_user_id: '4r345sdf')
      name = user.front_end_display_name
      name.should == '无名氏'

    end

  end

  describe 'set user avartar' do
    it 'should set my avartar success when I have uploaded a image' do
      user = User.create(weixin_user_id: '4r345sdf', display_name: 'Tom')
      user.messages.create message_type: 'image', picture_url: 'http://qq.com/logo.png'
      user.image_messages.size.should == 1
      result = user.set_avatar
      result.should == true
      User.find_by_display_name('Tom').avatar.should == 'http://qq.com/logo.png'
      user.image_messages.size.should == 0
    end

    it 'should return false if user did not upload a image' do
      user = User.create(weixin_user_id: '4r345sdf', display_name: 'Tom')
      result = user.set_avatar
      result.should == false
      User.find_by_display_name('Tom').avatar.should == nil

    end
  end

end
