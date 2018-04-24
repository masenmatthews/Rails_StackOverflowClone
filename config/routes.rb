Rails.application.routes.draw do
  devise_for :users
  root :to => 'layouts#index'

  resources :questions do
    resources :answers
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
