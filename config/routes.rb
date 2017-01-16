Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "articles#index"
  get "/articles/new", to: "articles#new", as: "articlenew"
  post "/articles/new", to: "articles#create"
  get "/articles/:slug", to: "articles#show", as: "article"
  post "/articles/:slug/comment", to: "articles#create_comment", as: "comment"
end
