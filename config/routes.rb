Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,:create]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    #単数にすると、そのコントローラのidがリクエストに含まれなくなる。
    resources :book_comments, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
end