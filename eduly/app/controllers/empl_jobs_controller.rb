class EmplJobsController < ApplicationController
    helper EmplJobsHelper

    def search
      search_params = {
        operator: "or",
        fields: ["designation_title^10", "organisation_name^9", "city_name^8"],
        page: params[:page],
        per_page: 10,
        order: {created_at: :desc}
      }

      if params[:search].present?
          @jobs = EmplJob.search(params[:search], search_params)
      else
          @jobs = EmplJob.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
      end
    end

    def show
      @job = EmplJob.find_by_slug(params[:id])
      @latest = EmplJob.order("created_at DESC").limit(4)
    end
end
