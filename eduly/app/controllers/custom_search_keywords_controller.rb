class CustomSearchKeywordsController < ApplicationController

  # State keywords links
  def madhya_pradesh_jobs
    search_params = {
      where: {city_name: "Madhya Pradesh"},
      page: params[:page],
      per_page: 10,
      fields: ["city_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "*", search_params
  end

  def maharashtra_jobs
    search_params = {
      where: {city_name: "Maharashtra"},
      page: params[:page],
      per_page: 10,
      fields: ["city_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "*", search_params
  end

  def kerala_jobs
    search_params = {
      where: {city_name: "Kerala"},
      page: params[:page],
      per_page: 10,
      fields: ["city_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "*", search_params
  end

  def pan_india_jobs
    search_params = {
      where: {city_name: "Pan India"},
      page: params[:page],
      per_page: 10,
      fields: ["city_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "*", search_params
  end


  # Popular Jobs Section 1
  def metro_rail_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["designation_title^10", "organisation_name^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Metro Rail", search_params
  end

  def police_defence_jobs
    search_params = {
      operator: "or",
      page: params[:page],
      per_page: 10,
      fields: ["designation_title^10", "organisation_name^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Police Defence", search_params
  end

  def research_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["designation_title^10", "organisation_name^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Research", search_params
  end

  def engineering_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["designation_title^10", "organisation_name^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Engineer", search_params
  end


  # Banking / Insurances keywords links
  def bank_of_baroda_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Bank of Baroda", search_params
  end

  def ibps_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "Institute of Banking Personnel Selection", search_params
  end

  def state_bank_of_india_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "State Bank of India", search_params
  end

  def all_banks_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }

    @jobs = EmplJob.search "bank", search_params
  end

  # Popular Jobs Section 2
  def railway_metro_rail_jobs
    search_params = {
      operator: "or",
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "Railway MetroRail", search_params
  end

  def medical_department_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "Medical", search_params
  end

  def high_court_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "High Court", search_params
  end

  def ssc_psc_upsc_jobs
    search_params = {
      operator: "or",
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "SSC PSC UPSC", search_params
  end


  # Navbar
  def teaching_jobs
    search_params = {
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "Teacher", search_params
  end

  def internship_apprenticeship_jobs
    search_params = {
      operator: "or",
      page: params[:page],
      per_page: 10,
      fields: ["organisation_name^10", "designation_title^9"],
      order: {created_at: {order: "desc", ignore_unmapped: true}}
    }
    @jobs = EmplJob.search "internship apprenticeship", search_params
  end
end
