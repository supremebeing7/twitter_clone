class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  after_create :send_followed_notification


private
  def send_followed_notification
    UserMailer.followed_notification(self.followed_id, self.follower_id).deliver
  end
end
