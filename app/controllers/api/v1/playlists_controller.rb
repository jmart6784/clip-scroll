class Api::V1::PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: [:update, :destroy]

  def index
    playlist = Playlist.all.order(created_at: :desc)
    render json: playlist
  end

  def create
    playlist = Playlist.new(playlist_params)
    playlist.user_id = current_user.id
    if playlist.save
      render json: playlist
    else
      render json: playlist.errors
    end
  end

  def show
    if playlist
      render json: playlist
    else
      render json: playlist.errors
    end
  end

  def update
    if playlist.update(playlist_params)
      render json: playlist
    else
      render json: playlist.errors
    end
  end

  def destroy
    playlist&.destroy
    render json: { message: 'playlist deleted!' }
  end
  
  def mine
    playlists = current_user.playlists
    if params[:video_id]
      playlist_ary = []

      playlists.each do |pl|
        pl = pl.as_json
        # Detect if video has already been added
        pl["added"] = !(PlaylistVideo.find_by(
          video_id: params[:video_id],
          source: pl["source"],
          user_id: current_user.id,
          playlist_id: pl["id"]
        ).nil?)
        playlist_ary << pl
      end
      render json: playlist_ary
    else
      render json: playlists
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :private, :source)
  end

  def playlist
    @playlist ||= Playlist.find(params[:id])
  end

  def set_playlist
    unless playlist.user === current_user
      render json: {}, status: 401
    end
  end
end
