Rails.application.routes.draw do
  root 'customers#new'
  resources :cities, except: %i[show edit update]
  resources :cleaners, except: %i[edit update]
  resources :customers, only: %i[index show create]
end
