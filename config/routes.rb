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

  namespace :nurse do
    get '/dashboard', to: "pages#dashboard"
    get '/login', to: "sessions#new"
    get '/success', to: "pages#success"
    get '/success_decline', to: "pages#success_decline"
    post '/main_appointment', to: "pages#main_appointment"
    post '/secondary_apppointment', to: "pages#secondary_apppointment"
    delete '/decline', to: "pages#decline"
    resources :sessions, only: :create
    get "/logout", to: "sessions#destroy"


    get '/student/information', to: "users#information"
    get '/student/emergency_contact', to: "users#emergency_contact"
    get '/student/history', to: "users#history"
  end

  namespace :doctor do
    get '/dashboard', to: "pages#dashboard"
    get '/login', to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    resources :sessions, only: :create
    resources :consultations

    get '/student/information', to: "users#information"
    get '/student/emergency_contact', to: "users#emergency_contact"
    get '/student/history', to: "users#history"

    get '/cancel', to: "consultations#cancel"
  end
end
