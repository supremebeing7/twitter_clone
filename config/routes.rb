TwitterClone::Application.routes.draw do
  root to: 'users#index'

  resources :sessions
  resources :users
end
