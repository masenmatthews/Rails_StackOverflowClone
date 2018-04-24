class User < ActiveRecord::Base
  has_many :questions
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  before_save :encrypt_password
  after_save :send_welcome_message

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
