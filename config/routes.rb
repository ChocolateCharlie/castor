Rails.application.routes.draw do
  resources :authors
  root 'books#index'

  resources :books, only: [:index, :create, :show, :update, :destroy]

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'

  get 'users/logout' => 'users#logout'

  get 'users/list' => 'users#list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
