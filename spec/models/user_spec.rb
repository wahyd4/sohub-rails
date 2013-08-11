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

end
