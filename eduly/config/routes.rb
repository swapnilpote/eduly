Rails.application.routes.draw do
  root "landings#index"

  resources :landings, only: [:index]

  get "search", to: "empl_jobs#search", as: "search"
  get "job/:id", to: "empl_jobs#show", as: "job"

  # Custom queries of states
  get "madhya-pradesh-jobs", to: "custom_search_keywords#madhya_pradesh_jobs", as: "madhya-pradesh-jobs"
  get "maharashtra-jobs", to: "custom_search_keywords#maharashtra_jobs", as: "maharashtra-jobs"
  get "kerala-jobs", to: "custom_search_keywords#kerala_jobs", as: "kerala-jobs"
  get "pan-india-jobs", to: "custom_search_keywords#pan_india_jobs", as: "pan-india-jobs"

  # Custom queries of popular jobs section 1
  get "metro-rail-jobs", to: "custom_search_keywords#metro_rail_jobs", as: "metro-rail-jobs"
  get "police-defence-jobs", to: "custom_search_keywords#police_defence_jobs", as: "police-defence-jobs"
  get "research-jobs", to: "custom_search_keywords#research_jobs", as: "research-jobs"
  get "engineering-jobs", to: "custom_search_keywords#engineering_jobs", as: "engineering-jobs"

  # Custom queries of banking / insurances
  get "bank-of-baroda-jobs", to: "custom_search_keywords#bank_of_baroda_jobs", as: "bank-of-baroda-jobs"
  get "ibps-jobs", to: "custom_search_keywords#ibps_jobs", as: "ibps-jobs"
  get "state-bank-of_india-jobs", to: "custom_search_keywords#state_bank_of_india_jobs", as: "state-bank-of-india-jobs"
  get "all-banks-jobs", to: "custom_search_keywords#all_banks_jobs", as: "all-banks-jobs"

  # Custom queries of popular jobs section 2
  get "railway-metro-rail-jobs", to: "custom_search_keywords#railway_metro_rail_jobs", as: "railway-metro-rail-jobs"
  get "medical-department-jobs", to: "custom_search_keywords#medical_department_jobs", as: "medical-department-jobs"
  get "high-court-jobs", to: "custom_search_keywords#high_court_jobs", as: "high-court-jobs"
  get "ssc-psc-upsc-jobs", to: "custom_search_keywords#ssc_psc_upsc_jobs", as: "ssc-psc-upsc-jobs"

  # Navbar
  get "teaching-jobs", to: "custom_search_keywords#teaching_jobs", as: "teaching-jobs"
  get "internship-apprenticeship-jobs", to: "custom_search_keywords#internship_apprenticeship_jobs", as: "internship-apprenticeship-jobs"

  # Static Pages links
  get "about-us", to: "static_pages#about"
  get "contact-us", to: "static_pages#contact"
  get "privacy-policy", to: "static_pages#privacy"
end
