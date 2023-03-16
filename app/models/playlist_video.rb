class PlaylistVideo < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :source, :playlist_id, :video_id, :parent_source_id, :user_id, presence: true
  validates :source, inclusion: { in: [ "youtube", "reddit", "mix" ] }
  
  validate :duplicate_videos
  validate :verify_sources

  def duplicate_videos
    existing_video = PlaylistVideo.find_by(
      playlist_id: playlist_id, 
      video_id: video_id, 
      source: source, 
      user_id: user_id, 
      parent_source_id: parent_source_id
    )

    unless existing_video.nil?
      errors.add(:video_id, "has already been added")
    end
  end

  def verify_sources
    playlist = Playlist.find(playlist_id)

    unless playlist.source == source || playlist.source == "mix"
      errors.add(:source, "is not supported")
    end
  end
end