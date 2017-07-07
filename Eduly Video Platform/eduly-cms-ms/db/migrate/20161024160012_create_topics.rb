class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :category, index: true, foreign_key: true
      t.string :topic_title
      t.text :topic_description

      t.timestamps null: false
    end
  end
end
