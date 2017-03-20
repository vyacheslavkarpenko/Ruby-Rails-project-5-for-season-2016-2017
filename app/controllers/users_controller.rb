class UsersController < ApplicationController
  include UsersHelper
   def get_current_user
     user = authenticateAndGetUserOrThrow401
     if user != nil
      render json: user, status: 200
     end

     # render json: current_user
   end

   def show
     render json: current_user
   end

   # before_action :authenticate

   # def index episodes = Episode.all
   #   render json: episodes, status: 200
   # end


   def new
     user = User.new
     user.last_name = 'bro'
     user.first_name = 'svat'
     user.phone = '12345'
     user.email = 'lol@mail.com'
     user.password_digest = 'boo'

     user.set_auth_token
     user.save
     render json: user
   end

end
