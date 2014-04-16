class UserMailer < ActionMailer::Base
  default from: "us@twitterclone.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign up confirmation"
  end

  def followed_notification(followed_id, follower_id)
    @followed = User.find(followed_id)
    @follower = User.find(follower_id)
    mail to: @followed.email, subject: "You have a new follower: #{@follower.username}!"
  end

  def send_confirmation(user)
    signup_confirmation(user).deliver
  end
end
