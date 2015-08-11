Rails.application.routes.draw do

  root 'users#index' # TODO: This is only temporary

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

end
