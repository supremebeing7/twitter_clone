class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  has_many :tweets

  before_create { generate_token(:auth_token) }
  after_create :send_signup_confirmation

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

private
  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
