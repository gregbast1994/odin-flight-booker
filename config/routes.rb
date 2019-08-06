Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/show'
  root 'flights#index'
  resources :bookings, only: [:new, :create, :show]
  resources :airports, only: [:show, :index]
  resources :flights, only: :index
end
