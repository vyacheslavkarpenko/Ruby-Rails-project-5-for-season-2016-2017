class MenuController < ApplicationController

  def index
    @menus = Menu.all
  end

  def show 
    @menu = Menu.all 
  end

end
