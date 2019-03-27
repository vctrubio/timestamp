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
  end
end
