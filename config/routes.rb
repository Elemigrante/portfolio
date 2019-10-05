Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # resource generator created 'resources :portfolios', but we override it for our purposes.
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  # custom route name
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  
  # get 'any string', to: 'controller#action', hard coded route
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  # basic default resources or scaffold, resources generators
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  # Root path to home(view) page on localhost:3000 instead rails standard template.
  # root to: 'controller#action', localhost:3000 now shows pages#home instead rails standard template.
  root to: 'pages#home'
end
