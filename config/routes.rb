Rails.application.routes.draw do
  devise_for :users

  #TOPページ設定
  root to: "items#index"
  resources :items, only: [:new, :create]


end
