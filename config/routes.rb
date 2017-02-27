Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :conversations_history, only: [:new, :create, :show, :destroy]
  end

  resources :users do
    resources :group_memberships
  end

end
