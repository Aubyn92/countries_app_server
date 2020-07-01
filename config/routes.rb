Rails.application.routes.draw do
  resources :countries
  post "/login", to: "user_token#create"
end
