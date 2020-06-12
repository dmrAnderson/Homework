Rails.application.routes.draw do
  root 'customers#new'
  resources :cities, except: %i[show edit update]
  resources :cleaners, only: %i[index show new create]
  resources :customers, only: %i[show create]
end
