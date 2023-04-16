class Api::V1::YoutubeController < ApplicationController
  include HTTParty
  before_action :limit_api, only: [:add_shorts]

  def videos
    videos = YoutubeVideo.all.order(Arel.sql('RANDOM()'))
    render json: videos, status: 200
  end

  def video
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{params[:id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    render json: JSON.parse(response.body)
  end

  def search
    uc = current_user.user_configuration
    first_request_today = false

    # Restrict YouTube Search daily limit to 1 request per day
    unless uc.last_requested.nil?
      first_request_today = uc.last_requested + 1.day < DateTime.now.utc
    else
      first_request_today = true
    end

    if first_request_today
      uc.update(last_requested: DateTime.now)

      response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&type=channel&maxResults=50&q=#{params[:search]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

      render json: JSON.parse(response.body)  
    else
      render json: {message: "Daily limit reached"}
    end
  end

  def add_shorts
    response = HTTParty.get("https://yt.lemnoslife.com/channels?part=shorts&id=#{params[:channel_id]}")
    shorts = JSON.parse(response.body)["items"][0]["shorts"]

    # Create channel if shorts exist
    if shorts.length > 0
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=snippet&maxResults=1&id=#{params[:channel_id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

        # current user adds a channel if not added
        if params[:refresh].nil?
          if AddedChannel.find_by(user_id: current_user.id, channel_id: params[:channel_id]).nil?
            AddedChannel.create!(
              user_id: current_user.id, 
              channel_id: params[:channel_id], 
              name: JSON.parse(response.body)["items"][0]["snippet"]["title"]
            )
          end
        end

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

  def videos_by_channel
    
  end

  private

  def playlist_params
    params.permit(:id, :video_id, :search, :channel_id)
  end

  def limit_api
    uc = current_user.user_configuration
    date_valid = false

    # Restrict Shorts API call daily limit to 5 requests per day
    unless uc.youtube_refresh_date.nil?
      # Has a day passed?
      date_valid = uc.youtube_refresh_date + 1.day < DateTime.now.utc

      # If date is valid (a day has passed) and the refresh limit is 0, set as 5.
      if date_valid && uc.youtube_channel_refresh_limit === 0
        uc.update(youtube_channel_refresh_limit: 5)
      end
    else
      # Update refresh date to now if refresh date is nil
      uc.update(youtube_refresh_date: DateTime.now.utc)
      date_valid = true
    end

    if uc.youtube_channel_refresh_limit != 0 || date_valid
      # Decrement allowed requests that are left and update refresh date
      uc.update(
        youtube_channel_refresh_limit: uc.youtube_channel_refresh_limit - 1,
        youtube_refresh_date: DateTime.now.utc
      )
    else
      render json: {message: "Too many request"}, status: 429
    end
  end
end
