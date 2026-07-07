Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :campaigns, only: [:show]
  root to: "campaigns#show", id: Campaign.first&.slug || 1
end
