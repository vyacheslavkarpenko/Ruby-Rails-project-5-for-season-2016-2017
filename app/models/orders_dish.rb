class OrdersDish < ApplicationRecord

  belongs_to :orders
  belongs_to :dishes
end
