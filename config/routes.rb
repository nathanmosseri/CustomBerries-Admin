Rails.application.routes.draw do
  resources :cart_items
  # resources :carts
  get '/carts/:sess_id', to: 'carts#show'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
