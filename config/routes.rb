Rails.application.routes.draw do
  root 'cities#new'

  resources :cities
end
