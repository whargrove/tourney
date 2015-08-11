Rails.application.routes.draw do

  root 'users#index' # TODO: This is only temporary

  get 'signup', to: 'users#new', as: 'signup'

  resources :users

end
