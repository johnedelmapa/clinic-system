Rails.application.routes.draw do
  devise_for :users, path: '',  path_names: {sign_in: 'login', sign_up: 'registration'},
  controllers: { registrations: 'users/registrations' }
  root to: 'pages#dashboard'
  get '/about', to: 'pages#about' 
  resources :users, only: [:create, :destroy]

  get '/users/information', to: 'users#information'
  patch '/users/information', to: 'users#information'
  get '/users/emergency_contact', to: 'users#emergency_contact'
  patch '/users/emergency_contact', to: 'users#emergency_contact'
  get '/users/history', to: 'users#history'
  patch '/users/history', to: 'users#history'

  resources :appointments do
    member do 
      get 'confirmation'
    end
  end
end
