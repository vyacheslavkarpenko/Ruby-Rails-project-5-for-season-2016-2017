module API
  module V1
    include UsersHelper
    class OrderDishAPI < Grape::API

      resource :orders_dishes do
        desc 'Returns all orders dishes.'
        get do
          if UsersHelper.authorize(self)
            { 'order_dishes': OrdersDish.all , 'order': Order.all}
          end
        end

        desc 'Creates new order dishes.'
        params do
          requires :order_id, type: String, desc: 'Order id.'
          requires :dish_id, type: String, desc: 'Dish id.'
        end
        post do
          if UsersHelper.authorize(self)
            order_dish = OrdersDish.new
            order_dish.order = Menu.find(params[:order_id])
            order_dish.dish = Dish.find(params[:dish_id])
            error = order_dish.save
            if error
              { 'id':order_dish.id, 'name':order_dish.name, 'restaurant':order_dish.description }
            else
              {'error':order_dish.errors.messages}
            end
          end
        end
      end
    end
  end
end