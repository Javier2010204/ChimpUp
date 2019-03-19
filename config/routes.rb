Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#dashboard"
    resources :companies
  end

  unauthenticated :user do
    root to: "home#index"
  	resources :companies, except: [:show, :index]
  end
end
