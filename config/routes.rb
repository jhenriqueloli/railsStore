Rails.application.routes.draw do
  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
 
  scope :consumer do
    get 'products', to: 'admin#index'
    resources :users, only: [:index]  
    post 'admin', to: 'users#admin'
    resources :accessories
    resources :essences
    resources :vapes
  end

  scope :store do
    get 'cart', to: 'cart#show'
    resources :orders
  resources :order_items
  end

end
