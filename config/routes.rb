Rails.application.routes.draw do
  root 'homes#top'
  devise_for :user
  resources :books
  resources :users
end