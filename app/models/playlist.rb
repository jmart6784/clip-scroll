class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_videos, dependent: :destroy
  before_update :destroy_unrelated_sources
  
  validates :name, :source, :user_id, presence: true
  validates :private, inclusion: { in: [ true, false ] }
  validates :source, inclusion: { in: [ "youtube", "reddit", "mix" ] }
  validates :name, length: {minimum: 1, maximum: 50}

  # When playlist source is updated, delete unrelated videos
  def destroy_unrelated_sources
    source_is = self.source

    if source_is != "mix" && source_changed? 
      if source_was == 'mix' && source_is == 'reddit'
        PlaylistVideo.where(playlist_id: self.id, source: 'youtube').destroy_all
      elsif source_was == 'mix' && source_is == 'youtube'
        PlaylistVideo.where(playlist_id: self.id, source: 'reddit').destroy_all
      elsif source_is == 'reddit' || source_is == 'youtube' 
        PlaylistVideo.where(playlist_id: self.id, source: source_was).destroy_all
      end
    end
  end
end