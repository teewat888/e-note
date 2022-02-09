Rails.application.routes.draw do
  
  root 'pages#home'

  get '/settings', to: 'settings#index'
  post '/setwing', to: 'settings#wing'

  resources :users
  resources :notes

  resources :notes do
    resources :comments
  end

  resources :comments

  namespace :admin do
    resources :wings
    resources :users_admin
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
