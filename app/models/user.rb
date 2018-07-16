class User < ApplicationRecord
  has_many  :orders
  has_secure_password
  
  validates :phone, numericality: { greater_than: 6, allow_nil: true }
  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  before_create :set_auth_token

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
