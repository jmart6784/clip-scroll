class AddedChannel < ApplicationRecord
  belongs_to :youtube_channel, primary_key: :channel_id, foreign_key: :channel_id
  belongs_to :user

  validates :channel_id, presence: true
  validates :user_id, presence: true
end