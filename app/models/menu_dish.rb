class MenuDish < ApplicationRecord
  belongs_to :menu
  belongs_to :dish
  validates  :dish_id, uniqueness: true
end
