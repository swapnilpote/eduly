class CreateEmplStates < ActiveRecord::Migration
  def change
    create_table :empl_states do |t|
      t.string :state_name

      t.timestamps null: false
    end
  end
end
