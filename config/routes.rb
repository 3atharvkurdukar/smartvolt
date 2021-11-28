Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/customer/register", to: "customer_registrations#new", as: "customer_register"
  post "/customer/register", to: "customer_registrations#create"

  get "/customer/login", to: "customer_sessions#new", as: "customer_login"
  post "/customer/login", to: "customer_sessions#create"
  get "/customer/logout", to: "customer_sessions#destroy", as: "customer_logout"

  get "/official/register", to: "official_registrations#new", as: "official_register"
  post "/official/register", to: "official_registrations#create"

  get "/official/login", to: "official_sessions#new", as: "official_login"
  post "/official/login", to: "official_sessions#create"
  get "/official/logout", to: "official_sessions#destroy", as: "official_logout"

  get "/customer/dashboard", to: "customers#index", as: "customer_dashboard"

  get "/customer/connections", to: "customer_connections#index", as: "customer_connections"
  get "/customer/connections/new", to: "customer_connections#new", as: "customer_connections_new"
  post "/customer/connections/new", to: "customer_connections#create"
  get "/customer/connections/:connection_id", to: "customer_connections#show", as: "customer_connection"

  get "/customer/connections/:connection_id/bills/new", to: "customer_connection_bills#new", as: "customer_connection_bills_new"
  post "/customer/connections/:connection_id/bills/new", to: "customer_connection_bills#create"
  get "/customer/connections/:connection_id/bills/:bill_id", to: "customer_connection_bills#show", as: "customer_connection_bill"

  get "/customer/connections/:connection_id/grievances/new", to: "customer_connection_grievances#new", as: "customer_connection_grievances_new"
  post "/customer/connections/:connection_id/grievances/new", to: "customer_connection_grievances#create"
  get "/customer/connections/:connection_id/grievances/:grievance_id", to: "customer_connection_grievances#show", as: "customer_connection_grievance"

  get "/official/dashboard", to: "officials#index", as: "official_dashboard"

  get "/official/bills", to: "official_bills#index", as: "official_bills"
  get "/official/bills/:bill_id", to: "official_bills#show", as: "official_bill"
  patch "/official/bills/:bill_id", to: "official_bills#update"

  get "/official/grievances", to: "official_grievances#index", as: "official_grievances"
  get "/official/grievances/:grievance_id", to: "official_grievances#show", as: "official_grievance"
  get "/official/grievances/:grievance_id/edit", to:"official_grievances#edit" ,as: "official_grievance_edit"
  patch "/official/grievances/:grievance_id", to: "official_grievances#update" , as: "official_grievance_patch"
end
