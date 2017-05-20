Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users_devise/registrations"}

  resources :users, only: [:show]

  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show", as: :page

  resources :posts
end
