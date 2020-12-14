Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  resources :tweeets, :user_profiles, :followers

  match '/users/:id', :to => 'users#update', :as => :user, via: :patch

  root "tweeets#index"
end
