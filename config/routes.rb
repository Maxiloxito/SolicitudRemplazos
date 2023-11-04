Rails.application.routes.draw do
  root 'pages#index'

  # Rutas para usuarios
  get 'register', to: 'users#new', as: 'register'
  post 'register', to: 'users#create'

  # Rutas para sesiones
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'pages/index'

  get 'dashboard', to: 'dashboard#index'

  resources :job_offers
  resources :employees, only: [:show, :edit, :update]
  resources :employers, only: [:show, :edit, :update]
  resources :employee_requests

end
