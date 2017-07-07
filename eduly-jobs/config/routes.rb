Rails.application.routes.draw do

	root 'sessions#new'

	resources :landings, only: [:index]
	resources :empl_designations do
		post 'import', on: :collection
	end

	resources :empl_organisations do
		post 'import', on: :collection
	end

	resources :empl_cities do
		post 'import', on: :collection
	end

	resources :empl_job_types do
		post 'import', on: :collection
	end

	resources :empl_jobs do
		post 'import', on: :collection
	end

	resources :empl_states do
		post 'import', on: :collection
	end
	# Signup routes
	resources :admin_users, only: [:create]
	get "signup", to: "admin_users#new", as: "signup"

	# login routes
	resources :sessions, only: [:create]
	get "login", to: "sessions#new", as: "login"
	delete "logout", to: "sessions#destroy", as: "logout"

end
