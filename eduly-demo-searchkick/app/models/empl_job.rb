class EmplJob < ActiveRecord::Base
	searchkick callbacks: :async

	# Associations
	belongs_to :empl_designation
	belongs_to :empl_organisation
	belongs_to :empl_city
	belongs_to :empl_job_type
	belongs_to :empl_education

	def search_data 
		{
			designation_title: 		empl_designation.id.to_s + '|' + empl_designation.designation_title,
			organisation_name: 		empl_organisation.id.to_s + '|' + empl_organisation.organisation_name,
			city_name: 				empl_city.id.to_s + '|' + empl_city.city_name,
			job_type: 				empl_job_type.id.to_s + '|' + empl_job_type.job_type,
			education_type: 		empl_education.id.to_s + '|' + empl_education.education_type,
			number_of_positions:  	number_of_positions,	
			job_type_detail: 		job_type_detail,
			notification_summary: 	notification_summary,
			announcemnet_date: 		announcemnet_date,
			start_application_date:	start_application_date,	
			last_application_date: 	last_application_date,
			salary_information: 	salary_information,
			monthly_salary: 		monthly_salary,
			salary_negotiable: 		salary_negotiable,
			application_procedure: 	application_procedure,
			written_test: 			written_test,
			interview: 				interview,
			online_test: 			online_test,
			language_test: 			language_test,
			physical_test: 			physical_test,
			medical_test: 			medical_test,
			selection_procedure_information: 	selection_procedure_information,	
			gender: 				gender,
			age: 					age,
			qualification: 			qualification,
			physical_requirement: 	physical_requirement,
			experience_information:	experience_information,	
			need_experience: 		need_experience
		}
	end

end
