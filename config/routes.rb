Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'static_pages#root'

  namespace :api, defaults: {format: 'json'} do
    resources :activities, only: [:create, :destroy, :show]
    resources :reviews, only: [:index, :create]
    resources :addresses, only: [:create, :destroy, :show, :index]
    get 'cities', to: 'cities#unique_cities'
    get 'cities/as_strings', to: 'cities#as_strings'
    resources :searches, only: [:index]
    resources :categories, only: [:create, :index]
    get 'categories/by_label', to: 'categories#by_label'
    resources :category_links, only: [:create, :index]
    resources :booked_activities, only: [:create, :index]
    resources :users, only: [:show, :update]
  end

  get '*a' => redirect('/')
end
