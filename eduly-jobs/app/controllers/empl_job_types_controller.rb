class EmplJobTypesController < ApplicationController

	before_filter :authorize
	before_action :set_empl_job_type, only: [:show, :edit, :update, :destroy]

	def index
		@empl_job_types = EmplJobType.all

		respond_to do |format|
			format.html
			format.csv { send_data @empl_job_types.to_csv }
		end
	end

	def show
	end

	def new
		@empl_job_type = EmplJobType.new
	end

	def create
		@empl_job_type = EmplJobType.new(empl_job_type_params)

		if @empl_job_type.save
			redirect_to @empl_job_type, notice: 'New Employment Job Type has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_job_type.update(empl_job_type_params)
			redirect_to @empl_job_type, notice: 'Employment Job Type has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_job_type.destroy
		redirect_to empl_job_types_path, notice: 'Employment Job Type has been deleted successfully.'
	end

	def import
		EmplJobType.import(params[:file])
		redirect_to empl_job_types_path, notice: "Empl Job Type imported."
	end


	private
		def empl_job_type_params
			params.require(:empl_job_type).permit(:job_type)
		end

		def set_empl_job_type
			@empl_job_type = EmplJobType.find(params[:id])
		end
end
