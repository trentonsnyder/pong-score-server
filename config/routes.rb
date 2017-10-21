Rails.application.routes.draw do
  post 'account_token', to: 'account_token#create'

  namespace :api do
    namespace :v1 do
      
    end
  end
end
