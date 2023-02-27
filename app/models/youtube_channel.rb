class YoutubeChannel < ApplicationRecord
  has_many :youtube_videos, primary_key: :channel_id, foreign_key: :channel_id
  validates :channel_id, uniqueness: true, presence: true
end
