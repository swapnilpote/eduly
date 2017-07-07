class CreateEmplOrganisations < ActiveRecord::Migration
  def change
    create_table :empl_organisations do |t|
      t.string :organisation_name

      t.timestamps null: false
    end
  end
end
