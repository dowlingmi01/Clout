Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users
    resources :categories, except: [:show]
    resources :surveys, except: [:show]
    resources :polls, except: [:show]
  end

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :votes, only: [:create]
  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :profiles, path: 'my-profile', except: :show
  resources :rewards, path: 'my-rewards', only: [:index]
  resources :enrollments
  resources :polls do
    resources :completions, only: [:create]     
  end
  patch 'questions/:id/move', controller: 'polls', action: :move
  root "home#index"
  resources :surveys do
    resources :completions, only: [:create]     
    resources :enrollments, only: [:new, :create]
  end
end
