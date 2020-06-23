Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :posts, only: [:index, :update, :edit, :create, :show] do
    member do
      post 'upload_image'
    end
  end
  resources :categories, only: [:show]
  resources :polaroids, only: [:index, :create, :show]
  get 'stats', to: 'pages#stats'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # post 'upload_image', to: 'posts#upload_image'
end
