Rails.application.routes.draw do
  resources :categories
  resources :news
  resources :cinemas
  resources :film_sessions
  resources :places
  get 'home/index'
  get 'calendar', to: 'home#calendar'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'users/:id' => 'users#show', :as => :user
  root 'home#index'
  post '/liqpay_payment' => 'payments#liqpay_payment'
end
