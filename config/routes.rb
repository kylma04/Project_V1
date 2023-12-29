Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # get '/participants', to: 'participants#index', as: 'participant'
  # Defines the root path route ("/")

  root to: "connexion#index"
  resources :participants#, only: [:new, :show, :update]
  resources :calendriers #, only: [:new, :show, :update]
  resources :administrators
  resources :votes

  get '/calendriers/:id', to: 'calendriers#index', as: 'calendriers_rt'

  resources :connexion, only: [:index]

  post '/connexion/login_participant', to: 'connexion#login_participant', as: 'login_participant'
  post '/connexion/login_administrator', to: 'connexion#login_administrator', as: 'login_administrator'

  delete '/connexion/logout_participant', to: 'connexion#logout_participant', as: 'logout_participant'
  delete '/connexion/logout_administrator', to: 'connexion#logout_administrator', as: 'logout_administrator'

end
