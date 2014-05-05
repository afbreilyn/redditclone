require 'spec_helper'

describe Sub do

  # belongs to moderator (user)
  # has many links
  # validate name
  # only modified by moderator



  context "belongs to moderator" do
    it { should belong_to(:moderator) }
  end

  let(:katie)      { FactoryGirl.build(:user) }
  let(:katies_sub) { katie.subs.new }


  it "uses inverse of correctly" do
    expect(katie).to eq(katies_sub.moderator)
  end

end