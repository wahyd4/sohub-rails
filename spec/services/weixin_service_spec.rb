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

end