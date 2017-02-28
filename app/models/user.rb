class User < ApplicationRecord

  validates :phone, numericality: { greater_than: 6, allow_nil: true }
  validates :first_name, :last_name, :phone, :email, :password_hash, presence: true
  has_many  :orders
end
