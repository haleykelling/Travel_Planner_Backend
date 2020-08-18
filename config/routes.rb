Rails.application.routes.draw do
  resources :day_accomodations
  resources :accomodations
  root 'welcome#index'
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  resources :day_transportations, only: [:create]
  resources :transportations, only: [:index, :create, :destroy]
  resources :activities, only: [:index, :create, :destroy]
  resources :days, only: [:index, :update]
  resources :comments, only: [:index, :create, :destroy]
  resources :trips, only: [:index, :create, :update, :destroy]
end
