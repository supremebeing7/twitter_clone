require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    let(:user) { mock_model User, username: 'Sparky', password: 'password', password_confirmation: 'password', email: 'sparky@me.com' }
    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      mail.subject.should eq("Sign up confirmation")
      mail.to.should eq([user.email])
      mail.from.should eq(["us@twitterclone.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Thank you for signing up with our play program!")
    end
  end

end
