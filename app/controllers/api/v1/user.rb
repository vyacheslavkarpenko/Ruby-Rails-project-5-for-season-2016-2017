module API
  module V1
    class User < Grape::API
      helpers do
        include UsersHelper
      end

      desc 'Returns pong.'
      params do
        requires :id, type: String, desc: 'Status ID.'
        requires :status, type: String, desc: 'Your status.'
      end
      get :ping do
        { ping: params[:pong] || 'pong' }
      end

      desc 'Current user.'
      get :user do
        user = authenticateAndGetUserOrThrow401
        if user != nil
          { user: auth || 'pong' }
        end
      end
    end
  end
end