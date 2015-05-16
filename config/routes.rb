Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/contact'

  get 'static_pages/about'

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
    end
  end

  root to: "cats#index"
end
