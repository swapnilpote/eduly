class CreateEmplJobTypes < ActiveRecord::Migration
  def change
    create_table :empl_job_types do |t|
      t.string :job_type

      t.timestamps null: false
    end
  end
end
