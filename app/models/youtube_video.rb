class YoutubeVideo < ApplicationRecord
  belongs_to :youtube_channel, primary_key: :channel_id, foreign_key: :channel_id, optional: true
  validates :channel_id, presence: true
end
