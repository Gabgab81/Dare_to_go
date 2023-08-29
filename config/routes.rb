Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users, only: :index
  resources :categorys, only: :index
  resources :challenges, only: [:index, :show, :new, :create, :edit, :update] do
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    resources :dares, only: [:index, :new, :create, :edit, :update, :show] do
      member do
        patch :accept
        patch :refuse
      end


      resources :journeys, only: [:index, :new, :create, :show, :edit, :update]
    end
  end

  resources :journeys, only: [:index]
  namespace :my do
    resources :journeys, only: [:index, :edit, :update, :destroy]
    resources :users, only: :show
    resources :dares, only: [:index, :show]

  end
  resources :alertes, only: :index, defaults: { format: :json }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
