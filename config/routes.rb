Rails.application.routes.draw do
  get 'stocks/index'
  get 'stocks/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  devise_for :admins
  devise_for :users
end
