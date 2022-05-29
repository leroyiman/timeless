Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers do
    resources :timeslots, only: [:new, :create]
    resources :bookings, only:[:create]
    resources :favorites, only: [:new, :create, :destroy]
    resources :hides, only: [:new, :create]
  end

  # patch 'statuses/:id', to: 'statuses#unfavorite', as: 'unfavorite'
  # post 'statuses/:id', to: 'statuses#favorite', as: 'favorite'

  resources :favorites, only: [:index]

  resources :bookings, only:[:index, :update]

  resources :searches


  get '/profile', to: 'pages#profile', as: 'profile'

  get '/advance', to: 'pages#advance', as: 'advance'

  get '/advance_results', to: 'offers#advance_offers', as: 'offers_advance'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
