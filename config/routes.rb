Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :campaigns, only: [ :show ] do
    resources :donations, only: [ :index, :create ] do
      member do
        patch :approve
        patch :cancel
      end
    end
  end

  root to: "campaigns#show"
end
