class EmplStatesController < ApplicationController

	before_filter :authorize
	before_action :set_empl_state, only: [:show, :edit, :update, :destroy]

	def index
		@empl_states = EmplState.order("state_name")

		respond_to do |format|
			format.html
			format.csv { send_data @empl_states.to_csv }
		end
	end

	def show
	end

	def new
		@empl_state = EmplState.new
	end

	def create
		@empl_state = EmplState.new(empl_state_params)

		if @empl_state.save
			redirect_to @empl_state, notice: 'New Employment State has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @empl_state.update(empl_state_params)
			redirect_to @empl_state, notice: 'Employment State has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@empl_state.destroy
		redirect_to empl_states_path, notice: 'Employment State has been deleted successfully.'
	end

	def import
		EmplState.import(params[:file])
		redirect_to empl_states_path, notice: "Empl State imported."
	end


	private
		def empl_state_params
			params.require(:empl_state).permit(:state_name)
		end

		def set_empl_state
			@empl_state = EmplState.find(params[:id])
		end
end
