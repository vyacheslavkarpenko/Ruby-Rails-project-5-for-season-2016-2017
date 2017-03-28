module API
  module V1
    include UsersHelper
    class OrderAPI < Grape::API

      resource :orders do
        desc 'Returns all orders.'
        get do
          if UsersHelper.authorize(self)
            { 'order': Order.all   }
          end
        end

        desc 'Creates new order.'
        params do
          requires :user_id, type: String, desc: 'User id.'
          requires :restaurant_id, type: String, desc: 'Restaurant id.'
          optional :complete, type: Boolean, values: [true], desc: 'Order completed.'
        end
        post do
          if UsersHelper.authorize(self)
            order = Order.new
            order.user = User.find(params[:user_id])
            order.restaurant = Restaurant.find(params[:restaurant_id])
            order.complete = params[:complete]
            error = order.save
            if error
              {'id':order.id, 'user':order.id, 'restaurant':order.restaurant}
            else
              {'error':order.errors.messages}
            end
          end
        end
      end
    end
  end
end