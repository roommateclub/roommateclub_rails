Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'locations/districts_index'
    end
  end

  resources :share_cases, only: [:index, :show]

  # resources :rent_cases, only: [:index, :show] do
  #   resources :groups
  #   post "add_pin", to: "user/groups#add_pin", on: :member
  # end

  # resources :groups do
  #   post "user_group_ships/create", on: :member, as: :user_join
  # end

  namespace :user, path: "/dashboard" do
    get 'base/index', path: "", as: :dashboard
    resource :profile, except: [:destroy]
    resources :share_cases
    resources :tenant_groups, except: [:new] do 
      post "/tenant_groups/ask_to_join_group", as: "ask_to_join", on: :member
    end
    # resources :rent_cases
    # resources :groups
    resources :apartments do
      post 'images/create', as: 'upload_image'
      # resources :images, only: [:create, :destroy]
      resources :rent_cases
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
