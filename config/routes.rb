Rails.application.routes.draw do
  get 'enquiries/index'
  


  get 'users/index'
  get '/login',to:"users#login"
  post "/autheticator",to: 'users#autheticator'

  root 'pages#home'
  get "/about_us", to:'pages#about_us'

  resources :users
  resources :enquiries


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
