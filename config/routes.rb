Rails.application.routes.draw do
  resources :buckets
  resources :distributions

  root 'distributions#index'
end
