Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  resources :offers do
    resources :bookings, except: :destroy
  end

  get 'my_offers', to: 'offers#my_offers'
  resources :bookings, only: :destroy
  # get my_offers
  # get my bookings
end
