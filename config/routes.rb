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

      get '/user_configuration/mine', to: 'user_configurations#mine'
      
      get '/youtube/videos', to: 'youtube#videos'
      get '/youtube/video/:id', to: 'youtube#video'
      get '/youtube/comments/:video_id', to: 'youtube#comments'
      get '/youtube/search/:search', to: 'youtube#search'
      post '/youtube/add_shorts/:channel_id', to: 'youtube#add_shorts'
      delete '/youtube/remove_shorts/:channel_id', to: 'youtube#remove_shorts'
      get '/youtube/channels', to: 'youtube#channels'
      get '/youtube/added_channels', to: 'youtube#added_channels'
      get '/youtube/my_channels', to: 'youtube#my_channels'
      get '/youtube/videos_by_channel/:channel_id', to: 'youtube#videos_by_channel'

      get '/playlist/index', to: 'playlists#index'
      post '/playlist/create', to: 'playlists#create'
      get '/playlist/show/:id', to: 'playlists#show'
      delete '/playlist/destroy/:id', to: 'playlists#destroy'
      put '/playlist/update/:id', to: 'playlists#update'
      get '/playlist/mine', to: 'playlists#mine'

      get '/playlist_videos/videos/:playlist_id', to: 'playlist_videos#videos'
      post '/playlist_videos/create', to: 'playlist_videos#create'
      delete '/playlist_videos/destroy_from_playlist', to: 'playlist_videos#destroy_from_playlist'

      get '/subreddit/index', to: 'subreddits#index'

      get '/addedsubreddit/mine', to: 'added_subreddits#mine'
      post '/addedsubreddit/create', to: 'added_subreddits#create'
    end
  end
end
