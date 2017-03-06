class RestaurantsController < ApplicationController
  before_action :set_res, only: [ :show, :destoy, :update, :edit ]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(res_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def set_res
    @restaurant = Restaurant.find(params[:id])
  end

  def res_params
    params.require(:restaurant).permit(:name, :address, :phone)
  end
end

