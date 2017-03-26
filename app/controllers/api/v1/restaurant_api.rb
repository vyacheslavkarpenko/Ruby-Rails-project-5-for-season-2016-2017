module API
  module V1
    include UsersHelper
    class RestaurantAPI < Grape::API

      resource :restaurants do
        desc 'Returns all restaurants.'
        get do
          if UsersHelper.authorize(self)
            { 'restaurants': Restaurant.all   }
          end
        end

        desc 'Creates new restaurant.'
        params do
          requires :name, type: String, desc: 'Restaurant name.'
          requires :address, type: String, desc: 'Restaurant address.'
          requires :phone, type: String, desc: 'Restaurant phone number.'
        end

        post do
          if UsersHelper.authorize(self)
            restaurant = Restaurant.new
            restaurant.name = params[:name]
            restaurant.address = params[:address]
            restaurant.phone = params[:phone]
            restaurant.save
            restaurant
          end
        end
      end
    end
  end
end