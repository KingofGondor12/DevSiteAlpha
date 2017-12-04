Rails.application.routes.draw do
  resources :games
  resources :charges
  resources :posts
  resources :topics
  resources :forums
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/help', to: 'pages#help'

end
