class EmplJobType < ActiveRecord::Base
	before_save :lower_job_type

	def lower_job_type
		self.job_type = job_type.downcase.split.map(&:capitalize).join(" ")
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_job_type|
				csv << empl_job_type.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_job_type = find_by_id(row["id"]) || new
			empl_job_type.attributes = row.to_hash
			empl_job_type.save!
		end
	end

	# Associations
	has_many :empl_jobs

	# Validations
	validates :job_type, presence: true
end
