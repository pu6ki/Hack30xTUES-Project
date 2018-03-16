Rails.application.routes.draw do
  devise_for :users

  resources :recruiters
  resources :contestants
  resources :schools
  resources :contests do
    resources :submissions
  end
end
