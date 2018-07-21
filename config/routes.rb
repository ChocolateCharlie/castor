Rails.application.routes.draw do
  get 'users/login'
  resources :books, only: [:index, :create, :show, :update, :destroy]

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
