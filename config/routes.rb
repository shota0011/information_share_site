Rails.application.routes.draw do
  get 'top/index'
  devise_for :users
  root "documents#index"
  resources :documents do
    resource :likes, only: [:create, :destroy]
  end
end
