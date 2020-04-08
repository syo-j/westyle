Rails.application.routes.draw do
  #get 'staffs/create'
  #get 'staffs/destroy'
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
    get '/shop/new' => 'users/registrations#shop', as: :new_shop
    get '/shop/edit' => 'users/registrations#shop_edit', as: :edit_shop
  end

  resources :users, only: [:show] do
    collection do
      get :setting
    end
    resource :relationships, only: [:create, :destroy]
    resource :staffs, only: [:create, :destroy]
  end

  resources :posts do
  	collection do
  		get :search
  	end
    member do
      get :new2
    end
    resources :clothes, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
