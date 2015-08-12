Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'static_pages#root'

  namespace :api, defaults: {format: 'json'} do
    resources :activities, only: [:create, :destroy, :show]
    resources :addresses, only: [:create, :destroy, :show, :index]
  end
end
