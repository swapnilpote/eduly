class JobsController < ApplicationController

	before_filter :beautify_search_url, only: [:index]

	def index
		@jobs = EmplJob.search(params[:query])
		# @jobs = EmplJob.search(params[:query].present? ? params[:query] : '*'), aggs: [:designation_title, :organisation_name, :city_name, :job_type, :education_type])

		# @aggs = @jobs.aggs

		conditions = {}
		conditions[:designation_title] = params[:designation_title] if params[:designation_title].present?
		conditions[:organisation_name] = params[:organisation_name] if params[:organisation_name].present?
		conditions[:city_name] = params[:city_name] if params[:city_name].present?
		conditions[:job_type] = params[:job_type] if params[:job_type].present?
		conditions[:education_type] = params[:education_type] if params[:education_type].present?

		@jobs = EmplJob.search((params[:query].present? ? params[:query] : '*'), where: conditions, aggs: [:designation_title, :organisation_name, :city_name, :job_type, :education_type])
	end

	private
		def beautify_search_url
			redirect_to search_jobs_path(query: params[:q]) if params[:q].present?
		end
end
