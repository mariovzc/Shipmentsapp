Rails.application.routes.draw do
  get 'sessions/index'

  get 'session/index'

  get 'users/new'

  get 'home/index'
  root 'home#index'

  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out

end
