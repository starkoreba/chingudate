Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  resources :offers do
    resources :bookings, except: %i[new destroy]
  end
  resources :bookings, only: :destroy

  get 'my_offers', to: 'offers#my_offers'
  get 'my_bookings', to: 'bookings#my_bookings'
end
