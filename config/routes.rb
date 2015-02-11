Rails.application.routes.draw do
  
  namespace :user, path: "/dashboard" do
    get 'base/index', path: "", as: :dashboard
    resource :profile, except: [:destroy]
    resources :apartments
  end

  get 'apartments/index', path: 'apartments', as: 'apartments'

  devise_for :users, controllers: { 
    registrations: "user/registrations",
    sessions: "user/sessions"
     }
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
end
