Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  resources :day_transportations, only: [:create]
  resources :transportations, only: [:index, :create, :destroy]
  resources :activities, only: [:index, :create, :destroy]
  resources :days, only: [:index, :update]
  resources :trips, only: [:index, :create, :update, :destroy]
end
