class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  has_many :subs,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: :Sub

  has_many :posts,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Post

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user && user.valid_password?(password)
    nil
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
