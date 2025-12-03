Rails.application.routes.draw do
  root 'top#main'
  resources :users
  resources :notes
  resources :subjects
  resources :tags
  resources :logs
  
  get "top/main"
  post 'login', to: 'top#login', as: :login
  get "login_form", to: "top#login_form", as: :login_form
end
