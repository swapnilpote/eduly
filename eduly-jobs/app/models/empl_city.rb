class EmplCity < ActiveRecord::Base
	before_save :lower_city_name

	def lower_city_name
		self.city_name = city_name.downcase.split.map(&:capitalize).join(" ")
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_city|
				csv << empl_city.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_city = find_by_id(row["id"]) || new
			empl_city.attributes = row.to_hash
			empl_city.save!
		end
	end

	# Associations
	belongs_to :empl_state
	has_many :empl_jobs

	# Validations
	validates :city_name, presence: true
end
