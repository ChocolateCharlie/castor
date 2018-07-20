Rails.application.routes.draw do
  get 'books' => 'books#index'
  post 'books' => 'books#create'

  get 'books/:id' => 'books#show'
  patch 'books/:id' => 'books#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
