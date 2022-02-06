Rails.application.routes.draw do
  
  root 'pages#home'
  resources :users
  resources :notes

  namespace :admin do
    resources :wings
    resources :users_admin
  end

end
