Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :projects, except: %i[index show]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :projects, only:  %i[index show] do
    resources :tickets
  end

  root "projects#index"
end
