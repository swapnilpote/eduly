class CreateEmplJobs < ActiveRecord::Migration
  def change
    create_table :empl_jobs do |t|
      t.references :empl_designation, index: true, foreign_key: true
      t.references :empl_organisation, index: true, foreign_key: true
      t.references :empl_city, index: true, foreign_key: true
      t.references :empl_job_type, index: true, foreign_key: true
      t.integer :number_of_positions
      t.string :job_type_detail
      t.text :notification_summary
      t.date :announcemnet_date
      t.date :start_application_date
      t.date :last_application_date
      t.text :salary_information
      t.string :monthly_salary
      t.boolean :salary_negotiable
      t.text :application_procedure
      t.boolean :written_test
      t.boolean :interview
      t.boolean :online_test
      t.boolean :language_test
      t.boolean :physical_test
      t.boolean :medical_test
      t.text :selection_procedure_information
      t.string :gender
      t.string :age
      t.text :qualification
      t.text :physical_requirement
      t.text :experience_information
      t.boolean :need_experience

      t.timestamps null: false
    end
  end
end
