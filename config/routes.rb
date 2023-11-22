# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_page#index'
  get '/about', to: 'about#index'
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions',
                                    passwords: 'passwords' }

  resource :profile, only: %i[show]

  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
