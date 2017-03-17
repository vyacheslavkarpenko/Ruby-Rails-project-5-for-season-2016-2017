Rails.application.routes.draw do
  
  post 'user_token' => 'user_token#create'
  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/sign_up" => "users#new"
  post "/sign_up" => "users#create"
  get "/users/sign_out" => "sessions#destroy"

  resources :users
  resources :restaurants, except: [ :destroy, :update, :create, :edit, :new ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
