Rails.application.routes.draw do
  root 'agents#front'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'

  resources :users
  resources :home
  resources :accounts

  resources :agents do
    resources :homes do
      resources :addresses
    end
  end
end
