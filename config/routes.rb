Rails.application.routes.draw do
  devise_for :users, controllers: {
    home: 'users/sessions'
    
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   
  root "categories#index"
  resources :categories do
    resources :tasks do
      delete :delete_all, on: :collection
    end 
  end
end
