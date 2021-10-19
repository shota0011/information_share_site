Rails.application.routes.draw do
  get 'top/index'
  devise_for :users
  root "documents#index"
  resources :documents do
    resource :likes, only: [:create, :destroy]
  end
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
