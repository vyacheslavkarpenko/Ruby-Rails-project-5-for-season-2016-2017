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

        desc 'Update address and phone.'
        params do
          requires :id, type: String, desc: 'Restaurant id '
          requires :address, type: String, desc: 'Restaurant address '
          requires :phone, type: String, desc: 'Restaurant phone.'
        end
        put ':id' do
          if UsersHelper.authorize(self)
            update_restaurant = Restaurant.find(params[:id]).update({
                address:params[:address],
                phone:params[:phone]
            })
            if update_restaurant
              { 'id':params[:id], 'address':params[:address], 'phone':params[:phone]}
            else
              { 'error':update_restaurant.errors.messages }
            end
          end
        end

        desc 'Delete restaurant.'
        params do
          requires :id, type: String, desc: 'Restaurant id.'
        end
        delete ':id' do
          if UsersHelper.authorize(self)
            Restaurant.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end