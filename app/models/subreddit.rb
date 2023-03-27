class Subreddit < ApplicationRecord
  validates :subreddit, uniqueness: true, presence: true
end
