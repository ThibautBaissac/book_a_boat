Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :ships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]
end
