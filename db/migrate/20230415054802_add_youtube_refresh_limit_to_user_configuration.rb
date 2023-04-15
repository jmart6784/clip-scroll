class AddYoutubeRefreshLimitToUserConfiguration < ActiveRecord::Migration[6.1]
  def change
    add_column :user_configurations, :youtube_channel_refresh_limit, :integer, default: 5, null: false
    add_column :user_configurations, :youtube_refresh_date, :datetime
  end
end
