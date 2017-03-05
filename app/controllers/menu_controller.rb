class MenuController < ApplicationController
  before_action :set_restaurant, only: [ :create ]
  before_action :set_menu, only: [ :create, :show ]

  def index
    @menus = Menu.all
  end


  def new
    @menu = Menu.new
  end

  def create
    @menu = @restaurant.menu.create(menu_params)
    if @menu.save
      redirect_to @menu
    else
      render :new
    end
  end

  def show 
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end

  def set_menu
    @menu = Menu.where(id: params[:id]).first
    render_404 unless @menu
  end


  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
