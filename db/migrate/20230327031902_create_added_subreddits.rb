class CreateAddedSubreddits < ActiveRecord::Migration[6.1]
  def change
    create_table :added_subreddits do |t|
      t.text :subreddit, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
