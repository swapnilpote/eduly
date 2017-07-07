class EmplJobsController < ApplicationController

	before_filter :authorize
	before_action :set_empl_job, only: [:show, :edit, :update, :destroy]

	def index
		@empl_jobs = EmplJob.order("created_at DESC")

		respond_to do |format|
			format.html
			format.csv { send_data @empl_jobs.to_csv }
		end
	end

	def show
	end

	def new
		@empl_job = EmplJob.new
	end

	def create
		@empl_job = EmplJob.new(empl_job_params)

		if @empl_job.save
			redirect_to @empl_job, notice: 'New Employment Job has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_job.update(empl_job_params)
			redirect_to @empl_job, notice: 'Employment Job has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_job.destroy
		redirect_to empl_jobs_path, notice: 'Employment Job has been deleted successfully.'
	end

	def import
		EmplJob.import(params[:file])
		redirect_to empl_jobs_path, notice: "Empl Job imported."
	end


	private
		def empl_job_params
			params.require(:empl_job).permit(:empl_designation_id, :empl_organisation_id, :empl_city_id, :empl_job_type_id, :number_of_positions,	:job_type_detail,	:notification_summary, :announcemnet_date, :start_application_date, :last_application_date, :salary_information, :monthly_salary, :salary_negotiable, :application_procedure, :written_test,	:interview,	:online_test,	:language_test,	:physical_test,	:medical_test,	:selection_procedure_information,	:gender,	:age,	:qualification,	:physical_requirement,	:experience_information,	:need_experience, :job_references_pdf)
		end

		def set_empl_job
			@empl_job = EmplJob.find_by_slug(params[:id])
		end
end
