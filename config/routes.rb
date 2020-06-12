Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts, only: [:index, :update, :edit, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'upload_image', to: 'posts#upload_image'
end
