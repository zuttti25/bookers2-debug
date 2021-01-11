Rails.application.routes.draw do
  get 'searchs/search'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users,only: [:show,:index,:edit,:update,:create,:destroy] 
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  
  get "/users/:id/relationships/follow" => "relationships#follow_index", as: "follow"
  get "/users/:id/relationships/following" => "relationships#following_index", as: "following"
  	
  resources :books do
    resource :favorites, only: [:create, :destroy]
    #単数にすると、そのコントローラのidがリクエストに含まれなくなる。
    resources :book_comments, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :relationships, only: [:create, :destroy]
  
  get '/search', to: 'searchs#search'
  
end