Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, :posts


  resources :users do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
