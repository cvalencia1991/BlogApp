Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show] do
      resources :likes, only:[:create,:show]
    end
  end
  resources :posts, only:[:new,:create]
  resources :comments, only:[:new,:create]

end
