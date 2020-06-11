Rails.application.routes.draw do
  resources :customers
  resources :cleaners
  resources :cities
  root 'cities#index'
end
