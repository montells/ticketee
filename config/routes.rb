Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :projects do
    resources :tickets
  end
  root "projects#index"
end
