Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  post 'frequests/send_request'
  patch 'frequests/accept_request'
  delete 'frequests/reject_request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
