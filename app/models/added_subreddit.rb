class AddedSubreddit < ApplicationRecord
  belongs_to :user
  validates :subreddit, :user_id, presence: true

  validate :duplicate_subreddits

  def duplicate_subreddits
    existing_addition = AddedSubreddit.find_by(user_id: user_id, subreddit: subreddit)

    unless existing_addition.nil?
      errors.add(:subreddit, "has already been added")
    end
  end
end