Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup' => "users#new"
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :users
  resources :entries, only: [:create, :destroy]  do
  	resources :comments, only:[:create]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end

