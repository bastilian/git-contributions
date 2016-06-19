Rails.application.routes.draw do
  if Rails.env.development?
    require 'resque/server'
    mount Resque::Server.new, at: '/resque'
  end

  resources :repositories do
    resources :commits, only: [:show, :index]
  end

  root 'repositories#index'
end
