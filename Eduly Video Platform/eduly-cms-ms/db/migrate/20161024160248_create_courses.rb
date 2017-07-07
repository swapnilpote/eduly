class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :topic, index: true, foreign_key: true
      t.string :course_title
      t.text :course_description

      t.timestamps null: false
    end
  end
end
