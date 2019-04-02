Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users
    resources :users do
      member do
        get :following, :followers
        post :follow, to: 'users#follow'
        delete :unfollow, to: 'users#unfollow'
      end
    resources :events
    #do not need comments for users
  end

  resources :events do
    member do
      patch :terminate
    end
    resources :comments, shallow: true
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index ]
    end
  end

  root to: 'events#index'
end
