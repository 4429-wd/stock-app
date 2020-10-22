Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  resources :stocks, only: [:index, :new, :create, :update, :destroy] 
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do  
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json'}
    end
  end
end
