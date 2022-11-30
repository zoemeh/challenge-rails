Rails.application.routes.draw do
  get 'reports/index'
  get 'reports', to: "reports#index"
  get 'reports/external'
  resources :repositories
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
