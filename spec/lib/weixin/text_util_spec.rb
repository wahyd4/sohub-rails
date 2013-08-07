require 'spec_helper'
require 'weixin/text_util'

describe TextUtil do
  include TextUtil

  describe 'weixin_util' do
    it 'should return true for call help' do
      flag = is_help 'h'
      flag.should == true
      is_help('help').should == true
    end

    it 'should return false for not call help' do
      is_help('dd').should == false
    end

    it 'should return true for call menu' do
      is_menu('m').should == true
      is_menu('menu').should == true
    end

    it 'should return false for not call menu' do
      is_menu('xc').should == false
    end

  end

  describe 'weixin normal message' do
    it 'should return true for normal message' do
      is_normal_message('-你好').should == true
    end

    it 'should return false for not a normal message' do
      is_normal_message('--你好').should == false
    end

    it 'should return true for a notice message' do
      is_notice('+通知').should == true
    end

    it 'should return false for not a notice message' do
      is_notice('++不是通知').should == false
    end
  end

  describe 'weixin actions' do
    it 'should return true for set name action' do
      is_set_name('=设置名字').should == true

    end
    it 'should return false for not a set name action' do
      is_set_name('==错误的设置名字').should == false
    end
  end
end