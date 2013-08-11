require 'spec_helper'

describe WeixinService do

  it 'should return the normal message text words' do
    message = Message.new
    message.message_type='text'
    message.content='-你好'
    result = WeixinService.new.handle_text message
    result.should == I18n.t('weixin.success.text')
  end

  it 'should return the menu text' do
    message = Message.new
    message.message_type='text'
    message.content='h'
    result = WeixinService.new.handle_text message
    result.should == I18n.t('weixin.help')
  end

  it 'should return the notice text' do
    message = Message.new
    message.message_type='text'
    message.content='+通知消息'
    result = WeixinService.new.handle_text message
    result.should == '通知信息发布成功'
    message.message_type == 'notce'
  end

  it 'should return the set name success text' do
    message = Message.new
    message.message_type='text'
    message.user_id = User.create(weixin_user_id: '4r345sdf').id
    message.content='=新的用户名'
    result = WeixinService.new.handle_text message
    result.should == '设置用户名成功'
    User.find_by_display_name('新的用户名').should_not == nil
  end

end