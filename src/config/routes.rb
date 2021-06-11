Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root 'posts#index'
  resources :users
  resources :posts do
    get :search, on: :collection
  end

  namespace :api, format: :json do
    namespace :v1 do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
  end
end
