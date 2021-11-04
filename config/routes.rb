Rails.application.routes.draw do

  root 'gossips#index'

  # static pages controller
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'

  resource :gossips
  resources :cities
  resources :gossips do
    resources :comments
  end


end
