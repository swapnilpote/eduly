class AddJobReferencesPdfToEmplJobs < ActiveRecord::Migration
  def change
    add_column :empl_jobs, :job_references_pdf, :string
  end
end
