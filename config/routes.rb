Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :posts, only: [:index, :update, :edit, :create, :show] do
    member do
      post 'upload_image'
    end
  end

  resources :dashboard, only: [:index]
  resources :categories, only: [:show]
  resources :polaroids, only: [:index, :create, :show]

  get 'stats', to: 'pages#stats'

end
