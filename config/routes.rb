Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/customer/register", to: "customer_registrations#new"
  post "/customer/register", to: "customer_registrations#create"

  get "/customer/login", to: "customer_sessions#new"
  post "/customer/login", to: "customer_sessions#create"
  get "/customer/logout", to: "customer_sessions#destroy"
end
