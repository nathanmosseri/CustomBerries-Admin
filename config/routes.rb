Rails.application.routes.draw do
  resources :cart_items
  get '/carts/:sess_id', to: 'carts#show'
  delete '/carts/:sess_id', to: 'carts#destroy'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
