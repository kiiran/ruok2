Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :conversation_histories, only: [:new, :create, :show, :destroy]
    resources :groups, only: [:index, :show]
    resources :group_memberships
  end
  resources :conversation_histories, only: :new
  resources :template_questions, only: [:index, :show]
end
