require 'spec_helper'

describe WeixinController do

  describe 'test i18n' do
    it 'should return the accurate value' do
      I18n.t('hello').should == '你好'
      I18n.t('weixin.success.text') == '信息发布成功'
      I18n.t('weixin.success.notice')== '通知信息发布成功'
      I18n.t('weixin.success.image')== '图片信息发布成功'
      I18n.t('weixin.dirty') =='随便发垃圾消息的孩子，不乖哦！试试help(h),或者menu(m)吧'
      I18n.t('weixin.help') == '欢迎使用Sohub微信客户端。\n使用+你的信息，发布通知、公告类信息\n,使用-你的消息,发布普通信息,还可以发送图片哦。菜单请输入m或者menu'
      I18n.t('weixin.menu') == '菜单：\n 1. 设置用户名\n 2.选择盒子\n'
      I18n.t('weixin.systemErr') == '系统操作失败,请确认信息输入正确后重试！'
    end
  end
end