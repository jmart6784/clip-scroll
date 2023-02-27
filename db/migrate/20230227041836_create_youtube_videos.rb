class CreateYoutubeVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_videos do |t|
      t.text :video_id, null: false, unique: true
      t.text :channel_id, null: false, unique: true

      t.timestamps
    end
  end
end
