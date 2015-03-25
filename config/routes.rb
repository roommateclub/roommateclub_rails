Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'locations/districts_index'
    end
  end

  resources :rent_cases, only: [:index, :show] do
    resources :groups, shallow: true
  end

  resources :groups, only: [:index, :show] do
    post "user_group_ships/create", on: :member, as: :user_join
  end

  namespace :user, path: "/dashboard" do
    get 'base/index', path: "", as: :dashboard
    resource :profile, except: [:destroy]
    resources :tenant_rent_cases
    resources :landlord_rent_cases
    resources :groups
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
