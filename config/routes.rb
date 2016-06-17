Rails.application.routes.draw do
  get 'settings/edit'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get  'settings', to: 'settings#edit'
  
  resources :users do
    member do
      get 'followings'
      get 'followers'
    end
  end
  resources :sesssions, only: [:new, :create, :destroy]
  resources :settings,  only: [:edit, :update]
  resources :microposts
  resources :sesssions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end