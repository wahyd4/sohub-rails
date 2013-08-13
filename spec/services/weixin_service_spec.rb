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

  it 'should return set avatar success text' do
    user = User.create(weixin_user_id: '4r345sdf', display_name: 'Tom')
    user.messages.create message_type: 'image', picture_url: 'http://qq.com/logo.png'

    message = Message.new
    message.message_type='text'
    message.user_id = user.id
    message.content='头像'
    result = WeixinService.new.handle_text message
    result.should == '设置头像成功'

  end

  it 'should return set avatar failed text' do
    user = User.create(weixin_user_id: '4r345sdf', display_name: 'Tom')

    message = Message.new
    message.message_type='text'
    message.user_id = user.id
    message.content='头像'
    result = WeixinService.new.handle_text message
    result.should == '设置头像失败，请先上传一张图片再进行设置'

  end

end