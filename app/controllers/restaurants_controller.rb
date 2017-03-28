class RestaurantsController < ApplicationController
  #before_filter :set_res, :except => [ :index, :create ]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants 
  end
 
  def create
    @restaurant = Restaurant.new(res_params)
    if @restaurant.save
      render json:  @restaurant, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update_attributes(res_params)
      render json: @restaurant 
    else
      render json: @restaurant.errors, status: :unprocessable_entity 
    end
  end

  def destroy
   if @restaurant.destroy
     render json: @restaurant 
   else 
     render json: @restaurant.errors, status: :unprocessable_entity
   end
  end

  def show
    render json: @restaurant
  end

  private

  def set_res
    @restaurant = Restaurant.find(params[:id])
  end

  def res_params
    params.require(:restaurant).permit(:name, :address, :phone)
  end
end

