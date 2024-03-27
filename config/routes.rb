Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
    resources :items do
      resources :bookings, only: [:new, :create]
    end
    resources :bookings, only: [:index, :show, :destroy]
    get '/accepted/:id', to: 'bookings#accepted', as: :accept
    get '/rejected/:id', to: 'bookings#rejected', as: :reject
  # Defines the root path route ("/")
  # root "posts#index"
end
