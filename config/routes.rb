Rails.application.routes.draw do

  resources :rent_cases, only: [:index, :show] do
    resources :groups, shallow: true
  end

  resources :groups, only: [:index, :show] do
    post :join_group, on: :member, as: :join
  end

  namespace :user, path: "/dashboard" do
    get 'base/index', path: "", as: :dashboard
    resource :profile, except: [:destroy]
    resources :tenant_rent_cases
    resources :landlord_rent_cases
    resources :apartments do
      resources :landlord_rent_cases
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
