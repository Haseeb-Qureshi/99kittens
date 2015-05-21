Rails.application.routes.draw do
  get '/home' => 'static_pages#home'
  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'

  resources :cats do
    resources :cat_rental_requests, only: [:new]
  end

  resources :cat_rental_requests, except: [:new] do
    member do
      post :approve, to: 'cat_rental_requests#approve'
      post :deny, to: 'cat_rental_requests#deny'
    end
  end

  resources :users, only: [:create, :new]

  resource :session, only: [:create, :new, :destroy] do
    member do
      get 'display'
      get 'dummy_login'
    end
  end

  root to: "static_pages#home"
end
