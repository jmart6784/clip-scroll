class CreateUserConfigurations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_configurations do |t|
      t.integer :youtube_search_limit, null: false, default: 1
      t.datetime :last_requested
      t.text :screen_fit, null: false, default: 'full'
      t.integer :user_id, null: false, unique: true

      t.timestamps
    end
  end
end
