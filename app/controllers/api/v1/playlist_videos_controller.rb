class Api::V1::PlaylistVideosController < ApplicationController
  include HTTParty

  def videos
    videos = []

    PlaylistVideo.where(playlist_id: params[:playlist_id]).each do |pv|
      if pv.source === "youtube"
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{pv.video_id}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
        pv = pv.as_json
        pv["video"] = JSON.parse(response.body)
        videos << pv
      end
    end
    render json: videos
  end

  def create
      playlist_video = PlaylistVideo.new(playlist_video_params)
      playlist_video.user_id = current_user.id
      
      if playlist_video.save
        render json: playlist_video
      else
        render json: playlist_video.errors, status: 422
      end
  end

  def destroy_from_playlist
    playlist_video = PlaylistVideo.new(playlist_video_params)
    playlist_video&.destroy
    render json: { message: 'playlist deleted!' }
  end

  private

  def playlist_video_params
    params.require(:playlist_video).permit(:video_id, :playlist_id, :source, :parent_source_id)
  end
end
