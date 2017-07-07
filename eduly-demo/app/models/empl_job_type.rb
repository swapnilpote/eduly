class EmplJobType < ActiveRecord::Base
	# Associations
	has_many :empl_jobs
	
	# Validations
	validates :job_type, presence: true

end
