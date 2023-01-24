Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  resources :users, only: [:create, :destroy]
end
