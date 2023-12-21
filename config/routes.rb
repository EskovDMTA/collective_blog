# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'home_page#show'
    devise_for :users, controllers: { registrations: 'registrations',
                                      sessions: 'sessions',
                                      passwords: 'passwords' }

    resource :about, only: %i[show], controller: 'about'
    resource :profile, only: %i[show], controller: 'profile'

    resources :posts do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
  end
end
