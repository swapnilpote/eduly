Rails.application.routes.draw do
  resources :jobs, only: [:index] do
    get 'search/*query', to: 'jobs#index', as: :search, on: :collection
  end

  root 'jobs#index'
end
