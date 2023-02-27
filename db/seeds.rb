require 'httparty'

# Default feed of YouTube channels and YouTube Shorts
ytChannels = [
  { id: "UCdC0An4ZPNr_YiFiYoVbwaw", name: "Daily Dose Of Internet" }
]

ytChannels.each do |channel|
  # Create channel
  if YoutubeChannel.find_by(channel_id: channel[:id]).nil?
    YoutubeChannel.create!(name: channel[:name], channel_id: channel[:id])
  end

  # Get YouTube Shorts by channel through 3rd party API
  response = HTTParty.get("https://yt.lemnoslife.com/channels?part=shorts&id=#{channel[:id]}")

  shorts = JSON.parse(response.body)["items"][0]["shorts"]


  shorts.each do |short|
    if YoutubeVideo.find_by(video_id: short["videoId"]).nil?
      YoutubeVideo.create!(channel_id: channel[:id], video_id: short["videoId"])
    end
  end
end