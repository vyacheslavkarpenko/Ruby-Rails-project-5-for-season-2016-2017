class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many   :orders_dishes
  has_many   :dishes, through: :orders_dishes
end
