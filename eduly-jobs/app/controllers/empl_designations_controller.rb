class EmplDesignationsController < ApplicationController

	before_filter :authorize
	before_action :set_empl_designation, only: [:show, :edit, :update, :destroy]

	def index
		@empl_designations = EmplDesignation.order("designation_title")

		respond_to do |format|
			format.html
			format.csv { send_data @empl_designations.to_csv }
		end
	end

	def show
	end

	def new
		@empl_designation = EmplDesignation.new
	end

	def create
		@empl_designation = EmplDesignation.new(empl_designation_params)

		if @empl_designation.save
			redirect_to @empl_designation, notice: 'New Employment Designation has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_designation.update(empl_designation_params)
			redirect_to @empl_designation, notice: 'Employment Designation has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_designation.destroy
		redirect_to empl_designations_path, notice: 'Employment Designation has been deleted successfully.'
	end

	def import
		EmplDesignation.import(params[:file])
		redirect_to empl_designations_path, notice: "Empl Designation imported."
	end


	private
		def empl_designation_params
			params.require(:empl_designation).permit(:designation_title)
		end

		def set_empl_designation
			@empl_designation = EmplDesignation.find(params[:id])
		end
end
