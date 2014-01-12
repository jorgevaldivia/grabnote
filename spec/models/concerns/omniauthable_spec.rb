require 'spec_helper'

describe Omniauthable do
  
  let(:user)         { FactoryGirl.create(:user) }
  let(:twitter_omni) { OmniAuth.config.mock_auth[:twitter] }
  let(:facebook_omni) { OmniAuth.config.mock_auth[:facebook] }

  describe "#apply_omni" do
    context "twitter" do

      before(:each) do
        user.apply_omniauth(twitter_omni)
      end

      it "creates the authentication with the correct values" do
        user.authentications.length.should eq 1
        user.authentications.first.provider.should eq "twitter"
        user.authentications.first.uid.should eq twitter_omni["uid"]
      end

      it "sets the profile image url" do
        user.profile_image.to_s.should include "image.jpg"
      end
    end

    context "facebook" do

      before(:each) do
        user.apply_omniauth(facebook_omni)
      end

      it "creates the authentication with the correct values" do
        user.authentications.length.should eq 1
        user.authentications.first.provider.should eq "facebook"
        user.authentications.first.uid.should eq twitter_omni["uid"]
      end

      it("sets the first name") { user.first_name.should eq "Henry" }
      it("sets the last name") { user.last_name.should eq "Jones" }
      it("sets the email") { user.email.should eq "indiana@grabnote.com" }
      it "sets the profile image url" do
        user.profile_image.to_s.should include "image.jpg"
      end
    end
  end
  
end
