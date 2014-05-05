require 'spec_helper'

describe Link do

  # test association between user and link
  # test association between link and sub
  # test inverse of between user and link
  # test validations

  let(:katie)      { FactoryGirl.build(:user) }
  let(:katies_sub) { katie.subs.new }
  let(:link1)   { katie.links.new}
  let(:link2)   { katies_sub.links.new}

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }

  it { should belong_to(:sub) }
  it { should belong_to(:poster) }

  it "uses inverse of correctly" do
    expect(link1.poster).to eq(katie)
    expect(link2.sub).to    eq(katies_sub)
  end

end