class EmplOrganisation < ActiveRecord::Base
	# Associations
	has_many :empl_jobs

	mount_uploader :company_logo, CompanyLogoUploader
end
