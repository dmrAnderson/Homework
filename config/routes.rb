Rails.application.routes.draw do
  root 'customers#new'
  resources :cities
  resources :cleaners
  resources :customers, only: %i[new create destroy] do
    get 'bookings/show', on: :member
  end
end
