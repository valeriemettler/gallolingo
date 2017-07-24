Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#placeholder"

  get 'landing', to: "static_pages#landing"
  
  get 'sessions/login'

  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  post 'sessions/login_attempt'

  resources :users
end
