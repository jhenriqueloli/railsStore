Rails.application.routes.draw do
  resources :users, expect: [:new]  
  resources :orders
  resources :order_items
  resources :accessories
  resources :essences
  resources :vapes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  post 'admin', to: 'users#admin'
  get 'signup', to: 'users#new' 
  get 'login', to: 'sessions#new' 
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'products', to: 'admin#index'
  get 'cart', to: 'cart#show'

end
