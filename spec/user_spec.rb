require 'spec_helper'

# feature "Sign Up" do
#
#   before :each do
#     visit "/user/new"
#   end
#
#   it "displays basic page info" do
#     page.should have_content "Sign Up"
#   end
#
# end

#user doesn't store password
#?session token gets stored
#?session token is changed upon logout
#find user through credentials


describe User do

  let(:user) { FactoryGirl.build(:user) }

  context "invalid account creation" do

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should ensure_length_of(:password) }

    it "resets session token" do
      st = user.token
      st2 = user.reset_token!
      expect(st).not_to eq(st2)
    end
  end

  context "after account creation" do

    before { user.save! }

    let(:u) { User.find_by(username: user.username) }

    it "password != password_digest" do
      expect(u.password_digest).not_to eq("sennacy")
    end

    it "should not return original password" do
      expect(u.password).to be_nil
    end

    it "should be findable by credentials" do
      u2 = User.find_by_credentials("jonathan", "sennacy")
      expect(u).to eq(u2)
    end
  end

  context "does stuff online" do
    it { should have_many(:subs) }
  end

end