class UserMailer < ActionMailer::Base
  default from: "us@twitterclone.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign up confirmation"
  end

  def send_confirmation(user)
    signup_confirmation(user).deliver
  end
end
