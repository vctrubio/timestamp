Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :events
    resources :comments
  end

  resources :events do
    member do
      patch :terminate
    end
    resources :comments
  end


  root to: 'events#index'
end
