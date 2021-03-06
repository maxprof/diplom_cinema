Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  resources :session_times
  resources :categories
  resources :news
  resources :comments, only: [:new, :create]
  resources :cinemas
  resources :film_sessions
  resources :places
  get 'home/index'
  get 'calendar', to: 'home#calendar'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'users/:id' => 'users#show', :as => :user
  resources :users, except: [:show]
  root 'home#index'
  get '/liqpay_payment' => 'payments#liqpay_payment'
  # get '*path' => redirect('/errors/not_found')
end
