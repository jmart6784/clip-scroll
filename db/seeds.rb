require 'httparty'

# Default feed of YouTube channels and YouTube Shorts
ytChannels = [
  { id: "UCdC0An4ZPNr_YiFiYoVbwaw", name: "Daily Dose Of Internet" },
  { id: "UCPDis9pjXuqyI7RYLJ-TTSA", name: "FailArmy" },
  { id: "UC38EdoY4Ky_IsVJ3dEzVxAQ", name: "FailArmy Shorts" },
  { id: "UCIJ0lLcABPdYGp7pRMGccAQ", name: "People Are Awesome" },
  { id: "UCPIvT-zcQl2H0vabdXJGcpg", name: "The Pet Collective" },
  { id: "UCsVXjNRWJMyXViNLM2pyMfg", name: "This Is Happening" },
  { id: "UCq-vSTqa-OPeMzx5fjH9w_w", name: "Poke My Heart" },
  { id: "UCfE5Cz44GlZVyoaYTHJbuZw", name: "Guga Foods" },
  { id: "UCpFuaxD-0PKLolFR3gWhrMw", name: "Sous Vide Everything" },
  { id: "UCvgfXK4nTYKudb0rFR6noLA", name: "UFC - Ultimate Fighting Championship" },
  { id: "UC82GyU7a3UhAMkOzVOxIlEw", name: "DIY Garden Channel" },
  { id: "UCyEd6QBSgat5kkC6svyjudA", name: "Mark Wiens" },
  { id: "UCXuqSBlHAE6Xw-yeJA0Tunw", name: "Linus Tech Tips" },
  { id: "UCpuT8AlP9P9EgW_pZ0_xInQ", name: "Dylan Anderson" },
  { id: "UC4ukq--KwuB31q3VyNs_BdA", name: "Moneytips" },
  { id: "UCIEv3lZ_tNXHzL3ox-_uUGQ", name: "Gordon Ramsay" },
  { id: "UCUZzyuAlhHNP3oiuMjn7RfQ", name: "Kitchen Nightmares" },
  { id: "UCMhe8jmac-tWKU0Vj_OXDvA", name: "enes Luciano" },
  { id: "UC03Yal14yoDsyLHUAambBig", name: "Rapleaks 100" },
  { id: "UCkhDeBavkCxdSycc_8ETWqQ", name: "calm_art" },
  { id: "UCGzmWIflRipbUfWjwRipMGg", name: "HighD Clips" },
  { id: "UCeb_Lnqnnsz81Sdj-2CX6Lg", name: "Contemporary Shorts" },
  { id: "UCX6OQ3DkcsbYNE6H8uQQuVA", name: "MrBeast" },
  { id: "UCigtcFawdenDMcbJHn733EQ", name: "joshlilj" },
  { id: "UCnmGIkw-KdI0W5siakKPKog", name: "Ryan Trahan" },
  { id: "UC9dbJfyzwduvCb0AFafPPkw", name: "Rogan Shorts" },
  { id: "UCyiEI_c33fDclGVgGa9sPPA", name: "WayWay Positivity" },
  { id: "UCWi5YwOMaZZBh2nCqaaDjRQ", name: "Secret facts" }
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

subreddits = [
  'AbruptChaos',
  '11foot8',
  'interestingasfuck',
  '21stCenturyHumour',
  '3Dprinting',
  'absoluteunit',
  'AbsoluteUnits',
  'AccidentalShoeLoss',
  'accidentalwrestling',
  'ActualPublicFreakouts',
  'ActLikeYouBelong',
  'adorableoldpeople',
  'AdultsAreFuckinStupid',
  'AllCombatSports',
  'amazingmemes',
  ''
]