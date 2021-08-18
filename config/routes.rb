Rails.application.routes.draw do
  get 'documents/index'
  get 'documents/show'
  get 'documents/new'
  get 'documents/create'
  get 'documents/edit'
  get 'documents/update'
  get 'documents/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
