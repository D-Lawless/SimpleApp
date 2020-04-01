Rails.application.routes.draw do

  resources :connections
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :profiles
  resources :comments
  resources :events



end
