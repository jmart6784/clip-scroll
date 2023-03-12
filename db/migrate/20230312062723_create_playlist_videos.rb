class CreatePlaylistVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_videos do |t|
      t.text :source, null: false
      t.integer :user_id, null: false
      t.integer :playlist_id, null: false
      t.text :video_id, null: false
      t.text :parent_source_id, null: false

      t.timestamps
    end
  end
end
