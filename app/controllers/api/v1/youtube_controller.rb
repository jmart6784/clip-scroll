class Api::V1::YoutubeController < ApplicationController
  include HTTParty

  def videos
    videos = YoutubeVideo.all.order(Arel.sql('RANDOM()'))
    render json: videos, status: 200
  end

  def video
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{params[:id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    render json: JSON.parse(response.body)
  end

  def search
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&type=channel&maxResults=50&q=#{params[:search]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    render json: JSON.parse(response.body)  
  end

  def add_shorts
    response = HTTParty.get("https://yt.lemnoslife.com/channels?part=shorts&id=#{params[:channel_id]}")
    shorts = JSON.parse(response.body)["items"][0]["shorts"]

    # Create channel if shorts exist
    if shorts.length > 0
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet&maxResults=1&id=#{params[:channel_id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

        # current user adds a channel
        AddedChannel.create!(
            user_id: current_user.id, 
            channel_id: params[:channel_id], 
            name: JSON.parse(response.body)["items"][0]["snippet"]["title"]
        )
        # Create channel if it does not exist
        if YoutubeChannel.find_by(channel_id: params[:channel_id]).nil?
            YoutubeChannel.create!(
                name: JSON.parse(response.body)["items"][0]["snippet"]["title"], 
                channel_id: params[:channel_id]
            )
        end
        # Create shorts videos
        shorts.each do |short|
            if YoutubeVideo.find_by(video_id: short["videoId"]).nil?
            YoutubeVideo.create!(channel_id: params[:channel_id], video_id: short["videoId"])
            end
        end
    end

    render json: YoutubeVideo.where(channel_id: params[:channel_id])
  end

  def remove_shorts
    AddedChannel.find_by(user_id: current_user.id, channel_id: params[:channel_id])&.destroy
    render json: { message: 'Channel removed' }
  end

  def channels
    channels = []
    ytChannels = YoutubeChannel.all.order("name").offset(params[:offset]).limit(5)

    ytChannels.each do |channel|
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=#{channel.channel_id}&maxResults=1&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
    
        channels << JSON.parse(response.body)
    end

    render json: channels
  end

  def added_channels
    render json: current_user.added_channels
  end

  def my_channels
    channels = []
    my_channels = current_user.added_channels.order("name").offset(params[:offset]).limit(5)
    my_channels.each do |channel|
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=#{channel.channel_id}&maxResults=1&key=#{Rails.application.credentials.dig(:youtube_api_key)}")
    
        channels << JSON.parse(response.body)
    end
    
    render json: channels
  end

  def comments
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,id,replies&videoId=#{params[:video_id]}&maxResults=100&order=relevance&textFormat=plainText&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    render json: JSON.parse(response.body)
  end

  private

  def playlist_params
    params.permit(:id, :video_id, :search, :channel_id)
  end
end
