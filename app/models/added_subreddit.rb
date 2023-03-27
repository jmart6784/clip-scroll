class AddedSubreddit < ApplicationRecord
  belongs_to :user
  validates :subreddit, :user_id, presence: true
end