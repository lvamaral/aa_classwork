Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :artworks, except: [:new, :edit]
  resources :artwork_shares, only: [:create, :destroy]
end
