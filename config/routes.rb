Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :restaurants, only: [:index, :create, :show, :destroy]
  resources :pizzas, only: [:index, :create]
  resources :restaurant_pizzas, only:[:index, :create]
end
