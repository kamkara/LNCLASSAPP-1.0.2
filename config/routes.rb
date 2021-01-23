Rails.application.routes.draw do

  resources :courses
  resources :materials
  resources :levels
  resources :helps
  
  get 'login/student'
  get 'login/teacher'
  get 'login/team'
  get 'dashboard/index'
  root to:'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
