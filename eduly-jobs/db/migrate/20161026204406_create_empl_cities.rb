class CreateEmplCities < ActiveRecord::Migration
  def change
    create_table :empl_cities do |t|
      t.references :empl_state, index: true, foreign_key: true
      t.string :city_name

      t.timestamps null: false
    end
  end
end
