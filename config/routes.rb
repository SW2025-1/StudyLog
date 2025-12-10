Rails.application.routes.draw do
  get "mypages/show"
  root 'top#main'
  resources :users
  resources :notes
  resources :subjects
  resources :tags
  resources :logs
  resource :mypage, only: :show
  
  get "top/main"
  post 'login', to: 'top#login', as: :login
  get "login_form", to: "top#login_form", as: :login_form
end
