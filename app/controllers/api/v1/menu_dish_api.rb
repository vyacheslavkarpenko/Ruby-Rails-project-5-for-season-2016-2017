module API
  module V1
    include UsersHelper
    class MenuDishAPI < Grape::API

      resource :menu_dishes do
        desc 'Returns all menu dishes.'
        get do
          if UsersHelper.authorize(self)
            { 'menu_dish': MenuDish.all , 'dish': Dish.all}
          end
        end

        desc 'Creates new menu dishes.'
        params do
          requires :menu_id, type: String, desc: 'Menu id.'
          requires :dish_id, type: String, desc: 'Restaurant id.'
        end
        post do
          if UsersHelper.authorize(self)
            menu_dish = MenuDish.new
            menu_dish.menu = Menu.find(params[:menu_id])
            menu_dish.dish = Dish.find(params[:dish_id])
            error = menu_dish.save
            if error
              { 'menu_dish_id':menu_dish.menu_id, 'menu_dish_id':menu_dish.dish_id }
            else
              {'error':menu_dish.errors.messages}
            end
          end
        end
      end
    end
  end
end