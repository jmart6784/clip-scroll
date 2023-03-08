class AddedChannel < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :channel_id, presence: true
  validates :user_id, presence: true
end
