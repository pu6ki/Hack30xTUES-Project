Rails.application.routes.draw do
  root to: 'contests#index'

  devise_for :users, only: [:sessions, :registrations, :passwords]

  resources :recruiters
  resources :contestants
  resources :schools
  resources :technologies
  resources :contests do
    resources :submissions
    resources :test_cases
  end
end
