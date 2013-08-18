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

    it 'should return true for call help and the letter is uppercase' do
      flag = is_help 'H'
      flag.should == true
      is_help('help').should == true
    end

    it 'should return false for not call help' do
      is_help('dd').should == false
    end

    it 'should return true for call menu' do
      is_menu('m').should == true
      is_menu('menu').should == true
      is_menu('M').should == true
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

    it 'should return false for just a +' do
      is_notice('+').should == false

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

  describe 'replace special symbol' do
    it 'should replace special symbol' do
      result = replace_symbol!('-你好')
      result.should == '你好'

    end

    it 'should return nil for input is nil' do
      result = replace_symbol!(nil)
      result.should == nil

    end
  end

  describe 'set avatar' do
    it 'should return true' do
      result = is_set_avatar('头像')
      result.should == true
    end

    it 'should return false for "头 像"' do
      result = is_set_avatar('头 像')
      result.should == false
    end

  end

  describe 'is set current hub' do
    it 'should return true for set current hub' do
      result = is_set_current_hub('#2')
      result.should == true
    end

    it 'should return false for the number is too large' do
      result = is_set_current_hub('#2564645')
      result.should == false
    end

    it 'should return false for there is only #' do
      result = is_set_current_hub('#')
      result.should == false
    end
  end

  describe 'get current hub from text' do
    it 'should return 22' do
      result = get_current_hub('#22')
      result.should == 22
    end
  end

end

