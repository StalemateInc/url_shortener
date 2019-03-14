# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'

  namespace :api do
    namespace :v1 do

    end
  end

end
