class RestaurantsController < ApplicationController
  before_action :set_res, only: [ :show, :edit, :update, :destroy ]
  before_action :check_if_admin, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    respond_to do |format|
      format.html
      format.json { render json: @restaurant }
    end
  end

  def create
    @restaurant = Restaurant.new(res_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update_attributes(res_params)
      redirect_to @restaurant
    else
      redirect_to :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to :index
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

  def check_if_admin
    render_403 unless params[:admin]
  end
end

