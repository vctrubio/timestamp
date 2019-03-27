Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :events
    resources :comments
  end

  resources :events do
    resources :comments
  end

  root to: 'events#index'
end
