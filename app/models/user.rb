class User < ActiveRecord::Base
  after_initialize :ensure_session_token

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
