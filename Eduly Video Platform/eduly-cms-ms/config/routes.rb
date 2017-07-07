Rails.application.routes.draw do
	root 'categories#index'

	resources :categories
	resources :topics
	resources :courses
end
