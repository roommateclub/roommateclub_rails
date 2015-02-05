Rails.application.routes.draw do
  
  namespace :user, path: "/dashboard" do
    get 'base/dashboard', path: "", as: :dashboard
    resource :profile, only: [:show, :edit, :update]
    resources :apartments
  end

  get 'apartments/index', path: 'apartments', as: 'apartments'

  devise_for :users
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
end
