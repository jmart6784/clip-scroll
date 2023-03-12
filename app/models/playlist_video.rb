class PlaylistVideo < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :source, :playlist_id, :video_id, :parent_source_id, :user_id, presence: true
  validates :source, inclusion: { in: [ "youtube", "reddit", "mix" ] }
end
