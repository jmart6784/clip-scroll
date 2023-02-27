class CreateYoutubeChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_channels do |t|
      t.string :name
      t.text :channel_id, null: false, unique: true

      t.timestamps
    end
  end
end
