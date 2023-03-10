class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.text :name, null: false
      t.text :source, null: false
      t.boolean :private, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
