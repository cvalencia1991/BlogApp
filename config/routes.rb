Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show] do
      resources :likes, only:[:create,:show]
      resources :comments, only:[:new,:create]
    end
  end
  resources :posts, only:[:new,:create]
end
