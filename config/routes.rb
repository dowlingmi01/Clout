Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index, :show]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :profiles
  resources :enrollments
  root "home#index"

  resources :surveys do
    resources :completions, only: [:create]
    resources :enrollments, only: [:new, :create]
  end
end
