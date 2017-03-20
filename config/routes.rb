Rails.application.routes.draw do
  mount API::Base => '/'
  resources :users

  get 'current_user' => 'users#get_current_user'
  post 'user_token' => 'user_token#create'
  mount Knock::Engine => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  resources :restaurants, except: [ :destroy, :update, :create, :edit, :new ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# GrapeOnRails::Application.routes.draw do
#   get 'welcome/index'
#   mount API => '/'
#   root 'welcome#index'
# end