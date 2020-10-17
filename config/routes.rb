Rails.application.routes.draw do
  devise_for :users
  root to: 'stocks#index'
  resources :stocks, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json'}
  # get 'stocks', to: 'stocks#index'
  # get 'stocks/new', to:'stocks#new'
  # post 'stocks', to: 'stocks#create'
    end
  end 
end
