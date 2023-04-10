class UserConfiguration < ApplicationRecord
  belongs_to :user

  validates :youtube_search_limit, :screen_fit, presence: true
  validates :screen_fit, inclusion: { in: [ "full", "zoom" ] }
  validates :user_id, uniqueness: true, presence: true
end
