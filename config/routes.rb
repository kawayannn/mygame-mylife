Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :users,         only:[:index, :show, ]
  root to:'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
