class AddedChannel < ApplicationRecord
  belongs_to :youtube_channel, primary_key: :channel_id, foreign_key: :channel_id
  belongs_to :user

  validates :channel_id, presence: true
  validates :user_id, presence: true

  validate :duplicate_channels

  def duplicate_channels
    existing_addition = AddedChannel.find_by(user_id: user_id, channel_id: channel_id)

    unless existing_addition.nil?
      errors.add(:channel_id, "has already been added")
    end
  end
end