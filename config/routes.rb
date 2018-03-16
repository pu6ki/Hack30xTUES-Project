Rails.application.routes.draw do
  devise_for :users

  resources :recruiters
  resources :contestants
end
