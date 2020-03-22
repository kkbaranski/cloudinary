# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'ads#index'
  resources :ads, only: [:show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ad_stats_reports, only: [:index]
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
