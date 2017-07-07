class EmplOrganisation < ActiveRecord::Base
	# Associations
	has_many :empl_jobs
	
	# Validations
	validates :organisation_name, presence: true

end
