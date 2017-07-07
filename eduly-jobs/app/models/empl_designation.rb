class EmplDesignation < ActiveRecord::Base
	before_save :lower_designation_title

	def lower_designation_title
		self.designation_title = designation_title.downcase.split.map(&:capitalize).join(" ")
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_designation|
				csv << empl_designation.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_designation = find_by_id(row["id"]) || new
			empl_designation.attributes = row.to_hash
			empl_designation.save!
		end
	end

	# Associations
	has_many :empl_jobs

	# Validations
	validates :designation_title, presence: true
end
