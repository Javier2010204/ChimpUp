Rails.application.routes.draw do
  resources :sub_categories
  resources :brands
  devise_for :users
  resources :companies
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#dashboard"
  end

  unauthenticated :user do
    root to: "home#index"
  end
end
