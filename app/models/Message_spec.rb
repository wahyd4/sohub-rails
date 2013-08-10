require 'spec_helper'

describe Message do

  describe 'identify a message whether need to store' do
    it 'should return true for normal text' do
      message = Message.new
      message.message_type='text'
      message.content='-你好'
      result = message.is_need_to_store
      result.should == true
    end

    it 'should return false for a set name command' do
      message = Message.new
      message.message_type='text'
      message.content='=我的名字'
      result = message.is_need_to_store
      result.should == false
    end

    it 'should return true for a image message' do
      message = Message.new
      message.message_type='image'
      message.picture_url='http://baidu.com/logo.gif'
      result = message.is_need_to_store
      result.should == true
    end
  end

end