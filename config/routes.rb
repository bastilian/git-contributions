Rails.application.routes.draw do
  resources :repositories do
    resources :commits, only: [:show, :index]
  end

  root 'repositories#index'
end
