Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  
  get 'login', to: 'user_sessions#new'
  post 'create', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  root 'user_sessions#new'
end
