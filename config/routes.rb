Rails.application.routes.draw do

  resources :sales do
    resources :sale_details
  end

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

  authenticated :user do
    root to: "home#dashboard"
  end

  unauthenticated :user do
    root to: "home#index"
  end
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
