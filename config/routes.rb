Rails.application.routes.draw do
  root 'customers#new'
  resources :cities, only: %i[index create destroy]
  resources :cleaners, only: %i[index create destroy]
  resources :customers, only: %i[index show create]
end
