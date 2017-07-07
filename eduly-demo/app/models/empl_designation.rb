class EmplDesignation < ActiveRecord::Base
	# Associations
	has_many :empl_jobs
	
	# Validations
	validates :designation_title, presence: true

end
