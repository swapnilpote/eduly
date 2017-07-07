class EmplOrganisation < ActiveRecord::Base
	# Associations
	has_many :empl_jobs

	# Validations
	validates :organisation_name, presence: true, uniqueness: true
	# validates :company_logo, presence: true

	mount_uploader :company_logo, CompanyLogoUploader

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_organisation|
				csv << empl_organisation.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_organisation = find_by_id(row["id"]) || new
			empl_organisation.attributes = row.to_hash
			empl_organisation.save!
		end
	end
end
