Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  mount Attachinary::Engine => "/attachinary"

  # Sidekiq Web UI, only for super_admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.super_admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root to: 'pages#home'

  post '/groups/:group_id', to: 'groups#send_questionnaire_to', as: 'send_questionnaire_to'

  resources :users do
    resources :conversation_histories, only: [:new, :create, :show, :destroy]
    resources :groups, only: [:index, :show]
    resources :group_memberships
  end

  get '/profile', to: 'users#profile', as: 'current_user_profile'

  resources :conversation_histories, only: :new
  resources :template_questions, only: [:index, :show]
  resources :groups do
    resources :group_memberships
    resources :conversation_histories, only: :edit
    get '/form', to: 'groups#form', as: 'current_user_form'

  end
  resources :groups
  resources :answers, only: :create

  resources :statistics_controller, only: [:index, :show]
end
