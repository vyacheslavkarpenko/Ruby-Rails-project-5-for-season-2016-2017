module API
  module V1
    class Base < Grape::API
      mount UserAPI
      mount RestaurantAPI
      mount DishAPI
      mount MenuAPI
      mount MenuDishAPI
      mount OrderDishAPI
      mount OrderAPI
    end
  end
end
