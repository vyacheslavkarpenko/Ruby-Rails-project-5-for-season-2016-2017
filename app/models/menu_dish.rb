class MenuDish < ApplicationRecord

  belongs_to :menus
  belongs_to :dishes
end
