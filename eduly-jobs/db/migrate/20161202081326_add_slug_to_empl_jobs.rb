class AddSlugToEmplJobs < ActiveRecord::Migration
  def change
    add_column :empl_jobs, :slug, :string
    add_index :empl_jobs, :slug, unique: true
  end
end
