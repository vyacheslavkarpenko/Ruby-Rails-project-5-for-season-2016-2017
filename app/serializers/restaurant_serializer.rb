class RestaurantSerializer < ActiveModel::Serializer
  attributes :name, :address, :phone
  has_one :menu
end