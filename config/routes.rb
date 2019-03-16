# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :links, only: %i[index create]
      resources :visits, only: :index
    end
  end

  get '*path', to: 'redirect#index'
end
