Rails.application.routes.draw do

  resources :rounds
  root 'tournaments#index'

  # Registration
  get 'signup', to: 'users#new', as: 'signup'

  # Authentication
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # Users
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :tournaments
  resources :players

end
