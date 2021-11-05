Rails.application.routes.draw do
  root 'gossips#index'
  # static pages controller
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'

  resources :gossips do
    resources :comments
  end
  resources :comment_likes
  resources :gossip_likes
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

end
