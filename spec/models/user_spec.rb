require 'spec_helper'

describe User do

  it 'should return the i18n words' do
    I18n.t('hello').should == '你好'
  end
end
