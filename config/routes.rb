Rails.application.routes.draw do
  get  'login',      to: 'user_sessions#new'
  post 'create',     to: 'user_sessions#create'
  get  'logout',     to: 'user_sessions#destroy'

  post 'new_event',  to: 'events#create'
  get  'new_event',  to: 'events#new'
  
  post 'attend/:id', as: 'attend', to: 'events#attend'

  resources :users, only: [:new, :create, :show]
  resources :events, except: [:edit, :update, :delete]

  
  root 'user_sessions#new'
end
