class EmplState < ActiveRecord::Base
	# Validations
	validates :state_name, presence: true

	# Associations
	has_many :cities
end
