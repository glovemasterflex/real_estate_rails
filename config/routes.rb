Rails.application.routes.draw do
  root 'agents#index'

  resources :agents do
    resources :homes do
      resources :addresses
    end
  end
end
