# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  balance         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_presence_of :username, :password_digest, :balance
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token, :intial_balance
  attr_reader :password

  has_many :bets_taken, class_name: "Bet", foreign_key: :bet_taker_id
  has_many :bets_placed, class_name: "PlacedBet", foreign_key: :user_id
  has_many :bets, through: :bets_placed, source: :bet

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user
    return user if user.is_password?(password)
    return nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def intial_balance
    self.balance = 500;
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save
    self.session_token
  end
end
