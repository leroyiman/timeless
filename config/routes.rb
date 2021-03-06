Rails.application.routes.draw do
  devise_for :users

  authenticate :user, ->(user) { user.is_admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  root to: 'pages#home'

  resources :matches, only: [:index, :show]

  resources :offers do
    resources :timeslots, only: [:new, :create]
    resources :bookings, only:[:create]
    resources :favorites, only: [:new, :create, :destroy]
    resources :hides, only: [:new, :create]
    resources :chatrooms, only: [:new, :create]
  end

  resources :favorites, only: [:index]

  resources :bookings, only:[:index, :update]

  resources :searches

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  get '/carousel', to: 'pages#carousel'


  get '/profile', to: 'pages#profile', as: 'profile'

  get '/profile/bookings', to: 'pages#bookings'

  get '/profile/:id', to: 'pages#profile_user', as: 'profile_user'

  get '/advance', to: 'pages#advance', as: 'advance'

  get '/advance_results', to: 'offers#advance_offers', as: 'offers_advance'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
