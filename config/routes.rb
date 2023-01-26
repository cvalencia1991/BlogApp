Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show]
  end
  resources :posts, only:[:new,:create]
  resources :comments, only: [:new, :create]
end
