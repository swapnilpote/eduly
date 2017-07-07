class EmplOrganisationsController < ApplicationController

	before_filter :authorize
	before_action :set_empl_organisation, only: [:show, :edit, :update, :destroy]

	def index
		@empl_organisations = EmplOrganisation.order("organisation_name")

		respond_to do |format|
			format.html
			format.csv { send_data @empl_organisations.to_csv }
		end
	end

	def show
	end

	def new
		@empl_organisation = EmplOrganisation.new
	end

	def create
		@empl_organisation = EmplOrganisation.new(empl_organisation_params)

		if @empl_organisation.save
			redirect_to @empl_organisation, notice: 'New Employment Organisation has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_organisation.update(empl_organisation_params)
			redirect_to @empl_organisation, notice: 'Employment Organisation has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_organisation.destroy
		redirect_to empl_organisations_path, notice: 'Employment Organisation has been deleted successfully.'
	end

	def import
		EmplOrganisation.import(params[:file])
		redirect_to empl_organisations_path, notice: "Empl Organisation imported."
	end

	private
		def empl_organisation_params
			params.require(:empl_organisation).permit(:organisation_name, :company_logo)
		end

		def set_empl_organisation
			@empl_organisation = EmplOrganisation.find(params[:id])
		end
end
