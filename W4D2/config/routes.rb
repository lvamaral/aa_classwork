Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create, :update, :edit, :destroy]
  resources :cat_rental_requests, only: [:index, :new, :create, :destroy, :update]

end
