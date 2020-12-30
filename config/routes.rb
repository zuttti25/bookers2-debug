Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update,:create]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end