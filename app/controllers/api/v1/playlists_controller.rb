class Api::V1::PlaylistsController < ApplicationController
  def index
    playlist = Playlist.all.order(created_at: :desc)
    render json: playlist
  end

  def create
    playlist = Playlist.create!(playlist_params)
    if playlist
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
    playlist.update!(playlist_params)
    render json: playlist
  end

  def destroy
    playlist&.destroy
    render json: { message: 'playlist deleted!' }
  end

  private

  def playlist_params
    params.permit(:name, :private, :source)
  end

  def playlist
    @playlist ||= Playlist.find(params[:id])
  end
end
