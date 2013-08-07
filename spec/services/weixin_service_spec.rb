require 'spec_helper'

describe WeixinService do

  it 'should return the normal message text words' do
    result = WeixinService.new.handle_text '-你好'
    result.should == I18n.t('weixin.success.text')
  end

  it 'should return the menu text' do
    result = WeixinService.new.handle_text('h')
    result.should == I18n.t('weixin.help')
  end
end