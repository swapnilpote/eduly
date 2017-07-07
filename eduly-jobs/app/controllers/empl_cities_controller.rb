class EmplCitiesController < ApplicationController

	before_filter :authorize
	before_action :set_empl_city, only: [:show, :edit, :update, :destroy]

	def index
		@empl_cities = EmplCity.order("city_name")

		respond_to do |format|
			format.html
			format.csv { send_data @empl_cities.to_csv }
		end
	end

	def show
	end

	def new
		@empl_city = EmplCity.new
	end

	def create
		@empl_city = EmplCity.new(empl_city_params)

		if @empl_city.save
			redirect_to @empl_city, notice: 'New Employment City has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_city.update(empl_city_params)
			redirect_to @empl_city, notice: 'Employment City has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_city.destroy
		redirect_to empl_cities_path, notice: 'Employment City has been deleted successfully.'
	end

	def import
		EmplCity.import(params[:file])
		redirect_to empl_cities_path, notice: "Empl City imported."
	end


	private
		def empl_city_params
			params.require(:empl_city).permit(:empl_state_id, :city_name)
		end

		def set_empl_city
			@empl_city = EmplCity.find(params[:id])
		end
end
