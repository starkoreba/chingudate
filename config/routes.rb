Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :bookings
  end

  get 'my_offers', to: 'offers#my_offers'
  get 'my_bookings', to: 'bookings#my_bookings'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
