Rails.application.routes.draw do
  
  resources :rent_cases, only: [:index, :show]

  namespace :user, path: "/dashboard" do
    get 'base/index', path: "", as: :dashboard
    resource :profile, except: [:destroy]
    resources :apartments do
      resources :rent_cases
    end
    get 'rent_cases' => 'rent_cases#index'
  end

  get 'apartments/index', path: 'apartments', as: 'apartments'

  devise_for :users, controllers: { 
    registrations: "user/registrations",
    sessions: "user/sessions"
     }
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
end
