Rails.application.routes.draw do
  resources :citytowns do
    resources :schools, only: 'index'
  end
  
  resources :schools
  resources :citytowns
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
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
