Rails.application.routes.draw do
  get 'group_memberships/show'

  get 'group_memberships/new'

  get 'group_memberships/create'

  get 'group_memberships/update'

  get 'group_memberships/destroy'

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
