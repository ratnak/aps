Apsides::Application.routes.draw do
  
  devise_for :users ,:controllers => { :sessions => "sessions" ,:registrations => "registrations" }
  #resources :user_sessions

  #get 'login' => "user_sessions#new",      :as => :login
  #get 'logout' => "user_sessions#destroy", :as => :logout

  #resources :users  # give us our some normal resource routes for users
  #resource :user, :as => 'account'  # a convenience route

  #get 'signup' => 'users#new', :as => :signup

  #root :to => 'users#new'
  
  resources :parties

  resources :favorites

  resources :zillow_details

  resources :properties

  #get 'home', to: 'application#home'
  get 'properties', to: 'properties#index'
  get 'properties/import/:date', to: 'properties#import'
  get 'properties/delete_all/:id', to: 'properties#clear_db'
  get 'zillow_details/import/:date', to: 'zillow_details#import'  
  get 'properties/parties/import/:date', to: 'parties#import'   
  root :to => 'home#index'
end
