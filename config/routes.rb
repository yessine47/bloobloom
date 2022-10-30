Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
      namespace :admin do
        resources :frames
        resources :lenses
      end
      namespace :user do
        resources :frames
        resources :lenses
        resources :glasses 
      end
  # resources :frames, param: :id 
  # resources :lenses, param: :id    
  # resources :glasses, param: :id       
  resources :users, param: :id
  post '/auth/login', to: 'authentication#login'
  post '/auth/register', to: 'authentication#create'
  post '/auth/register_admin', to: 'authentication#createAdmin'
  get "/auth/auto_login", to: "authentication#auto_login"
  # get '/*a', to: 'application#not_found'
end
