# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions',
                                    passwords: 'passwords'
  }
  root 'home_page#index'
  get '/about', to: 'about#index'
  resources :posts, only: %i[new create show index] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
