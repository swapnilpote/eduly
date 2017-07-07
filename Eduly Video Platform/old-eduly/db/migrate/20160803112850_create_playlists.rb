class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :advanced_category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :playlist_title, null: false
      t.text :playlist_description, null: false

      t.timestamps null: false
    end
  end
end
