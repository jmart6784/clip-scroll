class Api::V1::PlaylistVideosController < ApplicationController
  def videos
    videos = PlaylistVideo.where(playlist_id: params[:playlist_id])

    render json: videos
  end
end
