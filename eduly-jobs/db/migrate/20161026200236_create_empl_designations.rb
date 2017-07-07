class CreateEmplDesignations < ActiveRecord::Migration
  def change
    create_table :empl_designations do |t|
      t.string :designation_title

      t.timestamps null: false
    end
  end
end
