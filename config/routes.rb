Rails.application.routes.draw do
  resources :documents, only: [:show]
  resources :uploads
end
