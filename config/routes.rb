Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "welcome/say_hello" => "welcome#say"
  # root 'welcome#index'
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json }
    end
  end
end
