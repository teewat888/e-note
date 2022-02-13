Rails.application.routes.draw do
  
  root 'notes#index'

  get '/settings', to: 'settings#index'
  post '/setwing', to: 'settings#wing'

  resources :users do
    resources :notes
  end

  resources :wings do
    resources :notes
  end

  resources :acknowledges, only: [:create, :delete]
 
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

  get '*path' => redirect('/')

end
