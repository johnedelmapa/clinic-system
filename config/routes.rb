Rails.application.routes.draw do
  devise_for :users, path: '',  path_names: {sign_in: 'login', sign_up: 'registration'},
  controllers: { registrations: 'users/registrations' }
  root to: 'pages#dashboard'
  resources :users, only: [:create, :destroy]
end
