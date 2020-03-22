# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'ads#index'
  resources :ads, only: [:show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
