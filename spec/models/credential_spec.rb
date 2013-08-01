require 'spec_helper'

describe Credential do
  describe :create_google_credential do
    it "should create a credential obj for google oauth" do
      credential = Credential.create_google_credential 'token', 'refresh_token'
      credential.token.should == 'token'
      credential.refresh_token.should == 'refresh_token'
    end
  end

  describe :create_weibo_credential do
    it 'should create a credential obj for weibo oauth' do
      credential = Credential.create_weibo_credential 'weibo_token'
      credential.token.should == 'weibo_token'
    end
  end

  describe :update_google_token do
    it 'should update a google oauth token' do
      credential = Credential.create_google_credential 'token', 'refresh_token'
      new_credential = Credential.update_google_token 'token_new'
      new_credential.token.should == 'token_new'
    end
  end

end
