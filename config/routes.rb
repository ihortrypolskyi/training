Rails.application.routes.draw do
  resources :users
  # get 'users/new', to: 'users#new', as: 'signup'
  match '/signup', to: 'users#new', via: 'get'




  root 'static_pages#home'
  get 'static_pages/home', as: 'home'
  get 'static_pages/help', as: 'help'
  get 'static_pages/about', as: 'about'
  get 'static_pages/contact', as: 'contact'
end
