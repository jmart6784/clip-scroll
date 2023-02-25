class Api::V1::YoutubeController < ApplicationController
  include HTTParty

  def video
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{params[:id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    render json: JSON.parse(response.body)
  end
end


