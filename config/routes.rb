Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # config/routes.rb
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
      resources :users
      post 'signup', to: 'users#create'
      post '/auth/login', to: 'authentication#authenticate'
    end
  end
end
