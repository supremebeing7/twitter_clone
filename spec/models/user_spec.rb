require 'spec_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
  it { should have_many :tweets }
  it { should validate_presence_of :email }

  it "should validate uniqueness of username" do
    user1 = User.create(username: "Frank")
    user2 = User.new(username: "Frank")
    user2.save.should eq false
  end

  it "sends a signup confirmation" do
    @user = FactoryGirl.build :user
    expect(UserMailer).to receive(:signup_confirmation).with(@user)
    @user.save
  end
end
