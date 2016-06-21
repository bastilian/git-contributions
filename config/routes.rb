Rails.application.routes.draw do
  if ENV['RESQUE_WEB_UI']
    require 'resque_web'
    mount ResqueWeb::Engine => '/resque'
  end

  resources :repositories do
    resources :commits, only: [:show, :index]
  end

  root 'repositories#index'
end
