Rails.application.routes.draw do
  devise_for :users
  root to:'articles#index'
  post   '/like/:article_id' => 'likes#like',   as: 'like'
  delete '/like/:article_id' => 'likes#unlike', as: 'unlike'
  post   '/join/:group_id' => 'groups#join', as: 'join'
  delete   '/exit/:group_id' => 'groups#exit', as: 'exit'

  resources :users,         only:[:index, :show]

  resources :groups,        only:[:new, :create, :index, :destroy, :update, :show, :edit] do
    resources :messages,    only:[:index, :create]
  end

  resources :gametitles,    only:[:index, :search] do
    collection do
      get :search
    end
  end

  resources :articles do
    resources :comments,      only:[:create] 
    collection do
      get :search
    end
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
