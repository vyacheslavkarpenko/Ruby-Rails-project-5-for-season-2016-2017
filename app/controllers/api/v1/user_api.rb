module API
  module V1
    include UsersHelper
    class UserAPI < Grape::API

      #helpers do
      # def create_params
      #  declared(params).slice(:first_name, :last_name, :phone, :email, :password_digest)
      # end
      #end
      resource :users do
        desc 'Returns authorized user.'
        get do
          user = UsersHelper.authorize(self)
          present user, with: Entities::UserEntity
        end

        desc 'Returns new user.'
        params do
          requires :user_params, type: Hash do
            requires :first_name, type: String, desc: 'Users first name.'
            requires :last_name, type: String, desc: 'Users last name.'
            requires :phone, type: String, desc: 'Users phone number.'
            requires :email, type: String, desc: 'Users email.'
            requires :password_digest, type: String, desc: 'Users password.'
          end
        end
        post do
          user = User.new(declared(params, include_missing: false)[:user_params])
          user.set_auth_token
          user.save
          present user, with: Entities::UserEntity
        end
      end

    end
  end
end
