require 'spec_helper'

describe WeixinController do

  describe 'test i18n' do
    it 'should return the accurate value' do
      I18n.t('hello').should == '你好'
      I18n.t('weixin.success.text') == '信息发布成功'
      I18n.t('weixin.success.notice')== '通知信息发布成功'
      I18n.t('weixin.success.image')== '图片信息发布成功'

    end
  end
end