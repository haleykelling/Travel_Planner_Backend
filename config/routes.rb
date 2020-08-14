Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  resources :day_transportations
  resources :transportations
  resources :activities
  resources :days
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
