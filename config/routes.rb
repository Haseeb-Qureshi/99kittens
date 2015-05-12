Rails.application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only: [:new]
  end

  resources :cat_rental_requests, except: [:new] do
    member do
      post :approve, to: 'cat_rental_requests#approve'
      post :deny, to: 'cat_rental_requests#deny'
    end
  end
end
