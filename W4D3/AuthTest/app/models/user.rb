class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password_digest,
            presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
end
