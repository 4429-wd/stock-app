Rails.application.routes.draw do
  devise_for :users
  root to: 'stocks#index'
  get 'stocks', to: 'stocks#index'
  get 'stocks/new', to:'stocks#new'
  post 'stocks', to: 'stocks#create' 
end
