Rails.application.routes.draw do

  resources :comments
  root 'feed#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :profiles
  resources :connections



  resources :events do
    resources :eventposts do
      resources :comments
      end
  end



end
