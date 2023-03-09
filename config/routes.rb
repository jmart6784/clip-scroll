Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'homepage#index'

  namespace :api do
    namespace :v1 do
      get '/users/index', to: 'users#index'
      get '/users/show/:id', to: 'users#show'
      get '/users/user_info', to: 'users#user_info'
      
      get '/youtube/videos', to: 'youtube#videos'
      get '/youtube/video/:id', to: 'youtube#video'
      get '/youtube/comments/:video_id', to: 'youtube#comments'
      get '/youtube/search/:search', to: 'youtube#search'
      get '/youtube/add_shorts/:channel_id', to: 'youtube#add_shorts'
      get '/youtube/channels', to: 'youtube#channels'
      get '/youtube/added_channels', to: 'youtube#added_channels'
      get '/youtube/add_channel', to: 'youtube#add_channel'
    end
  end
end
