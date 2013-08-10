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

  describe 'change normal message to notice' do
    it 'message type should be notice' do
      message = Message.new
      message.message_type='text'
      message.to_notice
      message.message_type.should == 'notice'
    end
  end

  describe 'store the valid message ' do
    it 'should store normal text message' do
      lambda do
        message = Message.new
        message.message_type='text'
        message.content='-你好'
        result = message.store_message
      end.should change(Message, :count).by(1)

    end

    it 'should not store a help command' do
      lambda do
        message = Message.new
        message.message_type='text'
        message.content='help'
        result = message.store_message
      end.should change(Message, :count).by(0)
    end
  end

end