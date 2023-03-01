class Api::V1::YoutubeController < ApplicationController
  include HTTParty

  def videos
    videos = YoutubeVideo.all
    # videos = YoutubeVideo.all.order(Arel.sql('RANDOM()'))
    render json: videos, status: 200
  end

  def video
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=#{params[:id]}&key=#{Rails.application.credentials.dig(:youtube_api_key)}")

    # puts JSON.parse(response.body).inspect

    render json: JSON.parse(response.body)

    # render json: {"kind"=>"youtube#videoListResponse", "etag"=>"nkpHW4Q5v0_GR8mANaKzrX6_ZnU", "items"=>[{"kind"=>"youtube#video", "etag"=>"9Ko4pciJptfkvBz4OdfY9z-XQHU", "id"=>"XYAe15w39LQ", "snippet"=>{"publishedAt"=>"2023-02-24T21:56:36Z", "channelId"=>"UCdC0An4ZPNr_YiFiYoVbwaw", "title"=>"Watermelon without the melon", "description"=>"Source: Collab.Inc\n\n#shorts", "thumbnails"=>{"default"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/default.jpg", "width"=>120, "height"=>90}, "medium"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/mqdefault.jpg", "width"=>320, "height"=>180}, "high"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/hqdefault.jpg", "width"=>480, "height"=>360}, "standard"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/sddefault.jpg", "width"=>640, "height"=>480}, "maxres"=>{"url"=>"https://i.ytimg.com/vi/XYAe15w39LQ/maxresdefault.jpg", "width"=>1280, "height"=>720}}, "channelTitle"=>"Daily Dose Of Internet", "tags"=>["Internet", "Internet videos", "Daily Dose", "Animals", "TikTok", "Science", "TikTok Compilation", "Compilation", "Daily Dose Of Internet", "watermelon"], "categoryId"=>"24", "liveBroadcastContent"=>"none", "defaultLanguage"=>"en", "localized"=>{"title"=>"Watermelon without the melon", "description"=>"Source: Collab.Inc\n\n#shorts"}, "defaultAudioLanguage"=>"en"}, "statistics"=>{"viewCount"=>"184328", "likeCount"=>"7034", "favoriteCount"=>"0", "commentCount"=>"410"}}], "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}}
  end
end


