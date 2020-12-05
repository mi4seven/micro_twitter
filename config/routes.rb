Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  resources :tweeets
  resources :user_profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweeets#index"
end
