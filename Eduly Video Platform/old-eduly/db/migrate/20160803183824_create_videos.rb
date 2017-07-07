class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :playlist, index: true, foreign_key: true
      t.string :video_title, null: false
      t.text :video_description, null: false
      t.string :keywords, null: false
      t.string :video_url, null: false

      t.timestamps null: false
    end
  end
end
