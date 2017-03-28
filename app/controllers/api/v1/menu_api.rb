module API
  module V1
    include UsersHelper
    class MenuAPI < Grape::API

      resource :menus do
        desc 'Returns all menu.'
        get do
          if UsersHelper.authorize(self)
            { 'menu': Menu.all   }
          end
        end

        desc 'Creates new menu.'
        params do
          requires :name, type: String, desc: 'Menu name.'
          requires :restaurant_id, type: String, desc: 'Restaurant id.'
        end
        post do
          if UsersHelper.authorize(self)
            menu = Menu.new
            menu.name = params[:name]
            menu.restaurant = Restaurant.find(params[:restaurant_id])
            error = menu.save
            if error
              {'id':menu.id, 'name':menu.name, 'restaurant':menu.restaurant}
            else
              {'error':menu.errors.messages}
            end
          end
        end

        desc 'Delete menu.'
        params do
          requires :id, type: String, desc: 'Menu id.'
        end
        delete ':id' do
          if UsersHelper.authorize(self)
            Menu.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end