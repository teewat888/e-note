Rails.application.routes.draw do
  
  root 'pages#home'
  resources :users
  resources :notes

  namespace :admin do
    resources :wings
  end

end
