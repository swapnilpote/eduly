class EmplCity < ActiveRecord::Base
	# Associations
	belongs_to :empl_state
	has_many :empl_jobs
	
	# Validations
	validates :city_name, presence: true

end
