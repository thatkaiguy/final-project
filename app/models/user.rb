# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  after_initialize :ensure_session_token

  has_many :offered_activities,
  foreign_key: :creator_id,
  class_name: :Activity

  has_many :reviews,
  foreign_key: :author_id,
  class_name: :Review

  has_many :booked_activities,
  foreign_key: :customer_id,
  class_name: :BookedActivity

  validates :email, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_accessor :password

  def self.find_by_credentials(email, password)
    found_user = User.find_by(email: email)
    found_user && found_user.is_password?(password) ? found_user : nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    save!
    self.session_token
  end
end
