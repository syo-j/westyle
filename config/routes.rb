Rails.application.routes.draw do
  #get 'relationships/create'
  #get 'relationships/destroy'
  #get 'users/show'
  #get 'clothes/index'
  #get 'posts/index'
  #get 'posts/show'
  #get 'posts/new'
  #get 'posts/create'
  #get 'posts/edit'
  #get 'posts/search'

  root "posts#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # /shop/newを習得
  devise_scope :user do
    get '/shop/new' => 'users/registrations#shop' ,as: :new_shop
  end

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    
  end

  resources :posts do
  	collection do
  		get :search
  	end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
