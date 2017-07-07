class EmplJob < ActiveRecord::Base
	before_save :generate_slug

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names

			all.each do |empl_job|
				csv << empl_job.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			empl_job = find_by_id(row["id"]) || new
			empl_job.attributes = row.to_hash
			empl_job.save!
		end
	end

	# Elasticsearch config
	searchkick

	# Elasticsearch indexing setting
	def search_data
		{
			designation_title: empl_designation.designation_title,
			organisation_name: empl_organisation.organisation_name,
			city_name: empl_city.city_name,
			job_type: empl_job_type.job_type,
			number_of_positions: number_of_positions,
			job_type_detail: job_type_detail,
			notification_summary: notification_summary,
			announcemnet_date: announcemnet_date,
			start_application_date: start_application_date,
			last_application_date: last_application_date,
			salary_information: salary_information,
			monthly_salary: monthly_salary,
			salary_negotiable: salary_negotiable,
			application_procedure: application_procedure,
			written_test: written_test,
			interview: interview,
			online_test: online_test,
			language_test: language_test,
			physical_test: physical_test,
			medical_test: medical_test,
			selection_procedure_information: selection_procedure_information,
			gender: gender,
			age: age,
			qualification: qualification,
			physical_requirement: physical_requirement,
			experience_information: experience_information,
			need_experience: need_experience,
			created_at: created_at
		}
	end

	# Associations
	belongs_to :empl_designation
	belongs_to :empl_organisation
	belongs_to :empl_city
	belongs_to :empl_job_type

	# Validations
	validates :empl_designation_id, :empl_organisation_id, :empl_city_id, :empl_job_type_id, :number_of_positions, :job_type_detail, :notification_summary, :announcemnet_date, :start_application_date, :last_application_date, :salary_information, :monthly_salary, :application_procedure, :selection_procedure_information, :gender, :age, :qualification, :physical_requirement, :experience_information, presence: true

	# Generate slug value for urls
	def generate_slug
		self.slug = empl_designation.designation_title.parameterize + "-" + empl_city.city_name.parameterize + "-" + SecureRandom.urlsafe_base64(8)
	end

	def to_param
		slug
	end

	mount_uploader :job_references_pdf, JobReferencesPdfUploader
end
