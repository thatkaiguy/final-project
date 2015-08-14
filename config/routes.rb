Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'static_pages#root'

  namespace :api, defaults: {format: 'json'} do
    resources :activities, only: [:create, :destroy, :show]
    resources :reviews, only: [:index, :create]
    resources :addresses, only: [:create, :destroy, :show, :index]
    get 'cities', to: 'cities#unique_cities'
    resources :searches, only: [:index]
    resources :categories, only: [:create, :index]
    resources :category_links, only: [:create, :index]
  end

  get '*a' => redirect('/')
end
