Rails.application.routes.draw do
  root 'customers#new'
  resources :cities, only: %i[index create destroy]
  resources :cleaners, except: %i[edit update]
  resources :customers, only: %i[index show create]
end
