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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
