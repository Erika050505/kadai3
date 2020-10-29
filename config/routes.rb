Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'homes_about'
  devise_for :users
  resources :books
  resources :users, only: [:index,:show,:edit,:update]
end