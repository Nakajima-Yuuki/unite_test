Rails.application.routes.draw do
  
  #get 'proposers/show'
  #get 'home/index'
  #get 'home/show'
  root to: "home#index"
  devise_for :proposers, controllers:{
    sessions: 'proposers/sessions',
    passwords: 'proposers/passwords',
    registrations: 'proposers/registrations'
  }
  resources :proposers, only: [:show]

  
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
