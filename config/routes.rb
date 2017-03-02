Rails.application.routes.draw do
  get 'statistics_controller/index'

  get 'statistics_controller/show'

    # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.super_admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root to: 'pages#home'

  resources :users do
    resources :conversation_histories, only: [:new, :create, :show, :destroy]
    resources :groups, only: [:index, :show]
    resources :group_memberships
  end
  resources :conversation_histories, only: :new
  resources :template_questions, only: [:index, :show]

  resources :groups

  resources :answers, only: :create

  resources :statistics_controller, only: [:index, :show]
end
