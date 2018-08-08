Rails.application.routes.draw do
  devise_for :sellers, controllers: { sessions: 'sellers/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :products   
   
  root 'products#index'
 end
