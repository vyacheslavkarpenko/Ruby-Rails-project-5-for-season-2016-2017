module API
  module V1
    include UsersHelper
    class UserAPI < Grape::API

      resource :users do
        desc 'Returns authorized user.'
        get do
          UsersHelper.authorize(self)
        end

        desc 'Returns new user.'
        params do
          requires :first_name, type: String, desc: 'Users first name.'
          requires :last_name, type: String, desc: 'Users last name.'
          requires :phone, type: String, desc: 'Users phone number.'
          requires :email, type: String, desc: 'Users email.'
          requires :password_digest, type: String, desc: 'Users password.'
        end
        post do
          user = User.new
          user.email = params[:email]
          user.first_name = params[:first_name]
          user.last_name = params[:last_name]
          user.phone = params[:phone]
          user.password_digest = params[:password_digest]
          user.set_auth_token
          user.save
          user
        end
      end

    end
  end
end