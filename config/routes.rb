Rails.application.routes.draw do
  # ログイン機能のためdeviseを導入
  devise_for :users

  root to: 'homes#top'
  get "/home/about" => 'homes#about'
  resources :lists
  resources :users
end
