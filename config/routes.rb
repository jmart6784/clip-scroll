Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/index', to: 'users#index'
      get '/users/show/:id', to: 'users#show'
      get '/users/user_info', to: 'users#user_info'
    end
  end
  devise_for :users
  namespace :api do
    namespace :v1 do

    end
  end

  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
