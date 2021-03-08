Rails.application.routes.draw do
  # ログイン機能のためdeviseを導入
  devise_for :users

  root to: 'homes#top'
  get "/home/about" => 'homes#about'
  resources :lists do
    resources :movies, only: [:create, :destroy]
    resources :list_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
end
