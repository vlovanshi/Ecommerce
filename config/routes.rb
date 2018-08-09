Rails.application.routes.draw do
  devise_for :sellers, controllers: { sessions: 'sellers/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'products#index'
  resources :products 
    
end
