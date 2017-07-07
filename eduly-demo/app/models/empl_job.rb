class EmplJob < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	# Associations
	belongs_to :empl_designation
	belongs_to :empl_organisation
	belongs_to :empl_city
	belongs_to :empl_job_type
	belongs_to :empl_education

	mapping do
		indexes :id, index: :not_analyzed
		indexes :job_type_detail
		indexes :notification_summary
		indexes :announcemnet_date,				type: 'date'
		indexes :start_application_date,	type: 'date'
		indexes :last_application_date,		type: 'date'
		indexes :salary_information
		indexes :monthly_salary
		indexes :application_procedure
		indexes :selection_procedure_information
		indexes :gender
		indexes :age
		indexes :qualification
		indexes :physical_requirement
		indexes :experience_information

		indexes :empl_designation, type: 'nested' do
			indexes :id, 								type: 'integer'
			indexes :designation_title, type: 'string', index: :not_analyzed
		end
		indexes :empl_organisation, type: 'nested' do
			indexes :id, 								type: 'integer'
			indexes :organisation_name, type: 'string', index: :not_analyzed
		end
		indexes :empl_city, type: 'nested' do
			indexes :id, 				type: 'integer'
			indexes :city_name, type: 'string', index: :not_analyzed
		end
		indexes :empl_job_type, type: 'nested' do
			indexes :id, 				type: 'integer'
			indexes :job_type, 	type: 'string', index: :not_analyzed
		end
		# indexes :empl_education, type: 'nested' do
		# 	indexes :id, 							type: 'integer'
		# 	indexes :education_type,	type: 'string', index: :not_analyzed
		# end
	end

	def as_indexed_json(options = {})
		self.as_json(only: [:id, :job_type_detail, :notification_summary, :announcemnet_date, :start_application_date, :last_application_date, :salary_information, :monthly_salary, :application_procedure, :selection_procedure_information, :gender, :age, :qualification, :physical_requirement, :experience_information],
			include: {
				empl_designation:		{ only: [:id, :designation_title] }
				# empl_organisation:	{ only: [:id, :organisation_name] },
				# empl_city:					{ only: [:id, :city_name] },
				# empl_job_type:			{ only: [:id, :job_type] },
				# empl_education:			{ only: [:id, :education_type] }
		})
	end


	class << self
		def custom_search(query)
			__elasticsearch__.search(query: multi_match_query(query))
		end

		def multi_match_query(query)
			{
				multi_match: {
					query: query,
					type: "best_fields", # possible values "most_fields", "phrase", "phrase_prefix", "cross_fields"
					fields: ["empl_designation.designation_title^10"],
					operator: "and"
				}
			}
		end

		def aggregations
			{
				empl_designation_aggregation:
				{
					nested: { path: 'empl_designation' },
					aggs: empl_designation_aggregation
				}
			}
		end

		def empl_designation_aggregation
			{ id_and_designation_title:
				{
					terms: { script: "doc['empl_designation.id'].value + '|' + doc['empl_designation.designation_title'].value", size: 30 }
				}
			}
		end
	end
end
