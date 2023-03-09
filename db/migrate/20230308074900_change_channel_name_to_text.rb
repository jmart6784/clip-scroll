class ChangeChannelNameToText < ActiveRecord::Migration[6.1]
  def change
    change_column :youtube_channels, :name, :text
  end
end
