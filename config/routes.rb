Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :users, only: [:show]
  root "home#index"

  resources :surveys
end
