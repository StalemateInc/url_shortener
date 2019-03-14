# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  namespace :api do
    namespace :v1 do
      resources :links, only: %i[index create]
    end
  end

end
