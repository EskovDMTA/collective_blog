# frozen_string_literal: true

Rails.application.routes.draw do
  x
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions',
                                    passwords: 'passwords' }

  resource :about, only: %i[show]
  resource :profile, only: %i[show]

  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
