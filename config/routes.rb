Rails.application.routes.draw do
  resources :portfolios # from resource generator
  
  # get 'any string', to: 'controller#action'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs
  
  # Root path to home(view) page on localhost:3000 instead rails standard template.
  # root to: 'controller#action', localhost:3000 now shows pages#home instead rails standard template.
  root to: 'pages#home'
end
