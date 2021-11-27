Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/customer/register", to: "customer_registrations#new"
  post "/customer/register", to: "customer_registrations#create"

  get "/customer/login", to: "customer_sessions#new"
  post "/customer/login", to: "customer_sessions#create"
  get "/customer/logout", to: "customer_sessions#destroy"

  get "/official/register", to: "official_registrations#new"
  post "/official/register", to: "official_registrations#create"

  get "/official/login", to: "official_sessions#new"
  post "/official/login", to: "official_sessions#create"
  get "/official/logout", to: "official_sessions#destroy"

  get "/customer/dashboard", to: "customers#index"

  get "/customer/connections", to: "customer_connections#index"
  get "/customer/connections/new", to: "customer_connections#new"
  post "/customer/connections/new", to: "customer_connections#create"
  get "/customer/connections/:connection_id", to: "customer_connections#show"

  get "/customer/connections/:connection_id/bills/new", to: "customer_connection_bills#new"
  post "/customer/connections/:connection_id/bills/new", to: "customer_connection_bills#create"
  get "/customer/connections/:connection_id/bills/:bill_id", to: "customer_connection_bills#show"

  get "/customer/connections/:connection_id/grievances/new", to: "customer_connection_grievances#new", as: "customer_connection_grievances_new"
  post "/customer/connections/:connection_id/grievances/new", to: "customer_connection_grievances#create"
  get "/customer/connections/:connection_id/grievances/:grievance_id", to: "customer_connection_grievances#show"

  get "/official/dashboard", to: "officials#index"

  get "/official/bills", to: "official_bills#index"
  get "/official/bills/:bill_id", to: "official_bills#show"
  patch "/official/bills/:bill_id", to: "official_bills#update"

  get "/official/grievances", to: "official_grievances#index"
  get "/official/grievances/:grievance_id", to: "official_grievances#show"
  patch "/official/grievances/:grievance_id", to: "official_grievances#update"
end
