Rails.application.routes.draw do

  resources :line_items
  resources :carts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions
  resources :books
  get '/search',to: "books#search"
  root 'books#index'
end
