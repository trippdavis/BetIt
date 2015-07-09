Rails.application.routes.draw do
  root :to => "site#root"

  resources :users, only: [:new, :create, :show]
  resources :bets, only: [:create, :show, :index, :update, :destroy]
  resources :tags, only: [:create, :show, :index]
  resources :taggings, only: [:create, :destroy]
  resources :placed_bets, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
