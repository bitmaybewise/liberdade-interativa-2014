Rails.application.routes.draw do
  root to: 'produtos#index'

  resources :produtos
end
