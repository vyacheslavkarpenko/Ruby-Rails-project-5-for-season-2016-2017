class Dish < ApplicationRecord

  has_many :orders_dishes
  has_many :orders, through: :orders_dishes
  has_many :menu_dishes
  has_one  :menu, through: :menu_dishes
end
