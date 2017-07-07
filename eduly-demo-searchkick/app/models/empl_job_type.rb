class EmplJobType < ActiveRecord::Base
	# Associations
	has_many :empl_jobs
	
	# Validations
	validates :job_type, presence: true


	# Elasticsearch automatically synced when an association is updated.
	after_commit :reindex_empl_job

	def reindex_empl_job
		empl_jobs.reindex_async # or reindex
	end

end
