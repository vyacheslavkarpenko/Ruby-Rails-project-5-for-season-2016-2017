class Dish < ApplicationRecord
  has_many :orders_dish
  has_many :order, through: :orders_dish
  has_many :menu_dish
  has_one  :menu, through: :menu_dish
end
