Rails.application.routes.draw do

  get 'login/student'
  get 'login/teacher'
  get 'dashboard/index'
  resources :courses
  resources :materials
  resources :levels

  root to:'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
