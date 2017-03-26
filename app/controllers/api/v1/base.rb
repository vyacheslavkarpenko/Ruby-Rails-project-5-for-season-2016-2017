module API
  module V1
    class Base < Grape::API
      mount UserAPI
      mount RestaurantAPI
      mount DishAPI
      mount MenuAPI
    end
  end
end