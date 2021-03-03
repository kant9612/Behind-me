Rails.application.routes.draw do
  # ログイン機能のためdeviseを導入
  devise_for :users

  root to: 'homes#top'
  resources :lists
end
