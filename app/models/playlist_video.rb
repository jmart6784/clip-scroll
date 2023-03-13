class PlaylistVideo < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :source, :playlist_id, :video_id, :parent_source_id, :user_id, presence: true
  validates :source, inclusion: { in: [ "youtube", "reddit", "mix" ] }
  
  validate :duplicate_videos

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
end
# p = PlaylistVideo.new(source: "youtube", user_id: 12, playlist_id: 10, video_id: "VXl1s5gqFhM", parent_source_id: "UCdC0An4ZPNr_YiFiYoVbwaw")

# p = PlaylistVideo.create(source: "youtube", user_id: 12, playlist_id: 10, video_id: "VXl1s5gqFhM", parent_source_id: "UCdC0An4ZPNr_YiFiYoVbwaw")