Rails.application.routes.draw do
  post 'account_token', to: 'account_token#create'

  namespace :api do
    namespace :v1 do
      get 'accounts/auth', to: 'accounts#auth' 
    end
  end
end
