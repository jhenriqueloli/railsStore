Rails.application.routes.draw do
  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users, only: [:index]  
  resources :orders
  resources :order_items
  resources :accessories
  resources :essences
  resources :vapes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  post 'admin', to: 'users#admin'
  get 'products', to: 'admin#index'
  get 'cart', to: 'cart#show'

end
