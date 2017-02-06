Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "articles#show_users"
  get "/:username/articles/new", to: "articles#new", as: "articlenew"
  post "/:username/articles/new", to: "articles#create"
  get "/:username", to: "articles#article_index", as: "username"
  get "/:username/articles/:slug", to: "articles#show", as: "article"
  post "/:username/articles/:slug/comment", to: "articles#create_comment", as: "comment"
end
