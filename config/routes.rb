Rails.application.routes.draw do
  root "documents#index"
  resources :documents
  post '/documents/new', to: 'documents#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
