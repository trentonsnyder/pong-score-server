Rails.application.routes.draw do
  post 'account_token', to: 'account_token#create'

  namespace :api do
    get 'accounts/auth', to: 'accounts#auth'
    resources :players, only: [:index, :create]
    resources :games, only: [:create, :show, :index] do
      post 'points', to: 'points#create'
      delete 'points/undo', to: 'points#undo'
    end
  end
end
