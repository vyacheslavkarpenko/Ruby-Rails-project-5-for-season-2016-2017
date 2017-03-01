class Menu < ApplicationRecord

  belongs_to :restaurant
  has_many   :menu_dish
  has_many   :dish, through: :menu_dish
end
