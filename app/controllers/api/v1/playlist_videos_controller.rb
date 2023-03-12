class Api::V1::PlaylistVideosController < ApplicationController
  include HTTParty

  def videos
    videos = []

    PlaylistVideo.where(playlist_id: params[:playlist_id]).each do |pv|
      if pv.source === "youtube"
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{pv.video_id}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
        pv[:video] = JSON.parse(response.body)
        videos << pv
      end
    end

    render json: videos
  end
end
