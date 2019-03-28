Rails.application.routes.draw do
  resources :sale_details
  resources :sales
  resources :clients
  resources :attachments, only: [:new, :create, :destroy]
  resources :sub_categories
  resources :brands
  devise_for :users
  resources :companies
  resources :products
  resources :categories
  get '/brands_suggestion', to: 'brands_suggestion#index'
  get '/validate_suggested_brand', to: 'validate_suggested_brand#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#dashboard"
  end

  unauthenticated :user do
    root to: "home#index"
  end
end
