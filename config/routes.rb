Rails.application.routes.draw do
  root 'flights#index'
  resources :airports, only: [:show, :index]
  resources :flights, only: :index
end
