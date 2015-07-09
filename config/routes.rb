Rails.application.routes.draw do
  root :to => "site#root"
  
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
