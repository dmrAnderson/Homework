Rails.application.routes.draw do
  root 'wellcome_pages#index'

  resources :customers, only: %i[create]
end
