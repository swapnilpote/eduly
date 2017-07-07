class EmplState < ActiveRecord::Base
	before_save :lower_state_name

	def lower_state_name
		self.state_name = state_name.downcase.split.map(&:capitalize).join(" ")
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_state|
				csv << empl_state.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_state = find_by_id(row["id"]) || new
			empl_state.attributes = row.to_hash
			empl_state.save!
		end
	end

	# Assoications
	has_many :empl_cities

	# Validations
	validates :state_name, presence: true
end
