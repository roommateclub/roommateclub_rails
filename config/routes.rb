Rails.application.routes.draw do
  devise_for :users
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
end
