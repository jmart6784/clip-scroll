class UserConfiguration < ApplicationRecord
  belongs_to :user
  
  validates :youtube_search_limit, :last_requested, :screen_fit, presence: true
  validates :screen_fit, inclusion: { in: [ "full", "zoom" ] }
  validates :user_id, uniqueness: true, presence: true
  validate :valid_datetime
  
  def valid_datetime
    errors.add(:last_requested, 'must be a valid datetime') if ((DateTime.parse(last_requested) rescue ArgumentError) == ArgumentError)
  end
end
