Rails.application.routes.draw do

  root 'feed#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :profiles
  resources :connections
  resources :events do
    resources :eventposts
  end
  resources :comments



end
