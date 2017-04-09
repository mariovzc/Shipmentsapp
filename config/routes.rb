Rails.application.routes.draw do
  get 'admin/index'

  get 'home/index'

  root 'home#index'

  resources :users, only: [:new, :create]
  get 'user/document/:id' => 'users#user_by_document', as: 'user_by_document'
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out

  resources :fleets
  get 'fleets/filderByCity/:id' => 'fleets#fleets_by_city', as: 'fleets_filter_by_city'

  resources :bus

  resources :packages
end
