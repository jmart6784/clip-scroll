Rails.application.routes.draw do
  devise_for :users
  root 'homepage#index'

  namespace :api do
    namespace :v1 do
      get '/users/index', to: 'users#index'
      get '/users/show/:id', to: 'users#show'
      get '/users/user_info', to: 'users#user_info'
    end
  end
end
