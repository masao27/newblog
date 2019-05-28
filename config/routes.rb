Rails.application.routes.draw do
  devise_for :users
  root  'nblogs#index'
  resources :nblogs
end
