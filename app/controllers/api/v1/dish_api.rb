module API
  module V1
    include UsersHelper
    class DishAPI < Grape::API

      resource :dishes do
        desc 'Returns all dishes.'
        get do
          if UsersHelper.authorize(self)
            { 'dishes': Dish.all   }
          end
        end

        desc 'Creates new restaurant.'
        params do
          requires :name, type: String, desc: 'Dish name.'
          requires :description, type: String, desc: 'Description.'
          requires :price, type: Integer, desc: 'Price.'
          requires :weight, type: Float, desc: 'Weight.'
          requires :picture, type: String, desc: 'Picture url.'
        end

        post do
          if UsersHelper.authorize(self)
            dish = Dish.new
            dish.name = params[:name]
            dish.description = params[:description]
            dish.price = params[:price]
            dish.weight = params[:weight]
            dish.picture = params[:picture]
            dish.save
            dish
          end
        end
      end
    end
  end
end