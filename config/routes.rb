Rails.application.routes.draw do
  resources :cinemas
  resources :film_sessions
  resources :places
  get 'home/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'users/:id' => 'users#show', :as => :user
  root 'home#index'
end
