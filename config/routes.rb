Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_for :sellers, controllers: { sessions: 'sellers/sessions', registrations: 'sellers/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  root 'products#index'
  resources :products do
    resources :reviews
  end
  get '/order' => 'orders#place', :as => 'place_order'
  post '/order' => 'orders#place', :as => 'place'
  get 'myproduct' => 'products#myproduct', :as => 'myproduct'
  get '/verify/:id' => 'approvals#verify', :as => 'verify' 
  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  resources :carts   
  resources :approvals, only: [:index] 
end
   


 