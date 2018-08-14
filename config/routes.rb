Rails.application.routes.draw do
  devise_for :sellers, controllers: { sessions: 'sellers/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'products#index'
  resources :products 

  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  resources :carts    
end
  
