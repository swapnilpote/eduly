class JobsController < ApplicationController

	before_filter :beautify_search_url, only: [:index]

	def index
		search = EmplJob.custom_search((params[:query].present? ? params[:query] : '*'))


	end


	private
		def beautify_search_url
			redirect_to search_jobs_path(query: params[:q]) if params[:q].present?
		end
end
