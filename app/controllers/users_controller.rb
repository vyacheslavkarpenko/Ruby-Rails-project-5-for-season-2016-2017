class UsersController < ApplicationController
   def get_current_user 
     render json: current_user
   end

   def show
     render json: current_user
   end
end
