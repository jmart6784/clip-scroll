class CreateAddedChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :added_channels do |t|
      t.text :name
      t.text :channel_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
