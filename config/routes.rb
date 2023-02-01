Rails.application.routes.draw do
  devise_for :users
  root to:  'users#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show] do
      resources :likes, only:[:create,:show]
      resources :comments, only:[:new,:create]
    end
  end
  delete "logout", to: "sessions#destroy"
  resources :posts, only:[:new,:create]
end
