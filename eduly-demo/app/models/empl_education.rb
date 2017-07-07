class EmplEducation < ActiveRecord::Base
	# Associations
	has_many :empl_jobs
	
	# Validation
	validates :education_type, presence: true

end
