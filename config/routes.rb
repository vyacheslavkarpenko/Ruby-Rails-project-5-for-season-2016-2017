Rails.application.routes.draw do
  
  get 'users/index'

  get 'users/new'

  get 'users/login'

  get 'users/create'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'restaurants/index'

  get 'restaurants/show'

  get 'restaurants/create'

  get 'restaurants/edit'

  get 'restaurants/destroy'

  resources :users
  resources :restaurants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
