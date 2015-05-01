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
    resources :images, only: [:create, :destroy]
    get 'rent_cases' => 'rent_cases#index'
    patch "/user_group_ships/:id" => "user_group_ships#update", as: :update_user_group_ship
  end

  devise_for :users, controllers: { 
    registrations: "user/registrations",
    sessions: "user/sessions"
     }
  get 'pages/about'
  get 'pages/contact'
  root to: 'pages#landing'
end
