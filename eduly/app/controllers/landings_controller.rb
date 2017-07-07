class LandingsController < ApplicationController

    def index
        @jobs = EmplJob.order("created_at DESC").limit(4)
    end
end
