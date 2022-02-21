Rails.application.routes.draw do
  
  root 'notes#index'
  #setting cookies for computer location
  get '/settings', to: 'settings#index'
  post '/setwing', to: 'settings#wing'

  resources :users, only: [:show] do
    resources :notes, only: [:show, :index, :new, :create, :update, :edit]
  end

  namespace :admin do
    resources :wings
    resources :users_admin
    resources :tags
  end

  get 'wings', to: 'admin/wings#index'

  resources :wings do
    resources :notes
  end

  get 'tags', to: 'admin/tags#index'

  resources :tags do
    resources :notes
  end

  resources :acknowledges, only: [:create, :index]
 
  get 'note/bump/:id', to: 'notes#bump', as: 'note_bump'

  get '/notes/search', to: 'notes#search', as: 'notes_search'

  resources :notes

  resources :comments, only: [:create, :destroy]

  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '*path' => redirect('/')

end
