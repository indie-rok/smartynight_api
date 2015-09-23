Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "api/omniauth_callbacks" }
  #api routes
  namespace :api, defaults: { format: :json } do
    resources :venues, only: [:index,:show]
    patch 'venues' => 'venues#update'
    resources :dancers
    patch 'dancers' => 'dancers#update'
    resources :parties
    resources :sessions
    resource :users

    resources :likes , only: [:create,:index]
    delete 'likes/:venue_id', to: 'likes#destroy'
    resources :claims, only: [:create]
    post 'emails', to: 'emails#contact_email'
    resources :parties
    get 'cities', to: 'cities#index'
    get 'search/:model/:name', to: 'searches#index'
  end

end
