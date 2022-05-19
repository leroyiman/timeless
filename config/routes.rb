Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers do
    resources :timeslots, only: [:new, :create]
    resources :bookings, only:[:create]
  end

  resources :bookings, only:[:index]

  resources :searches

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
