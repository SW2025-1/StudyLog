Rails.application.routes.draw do
  get "subjects/index"
  get "subjects/new"
  get "subjects/create"
  get "subjects/edit"
  root 'top#main'
  resources :users
  resources :notes
  resources :subjects
  
  get "top/main"
  post 'login', to: 'top#login', as: :login
  get "login_form", to: "top#login_form", as: :login_form
end
