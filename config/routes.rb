Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "articles#show_users"
  get "/:username/new", to: "articles#new", as: "article_new"
  post "/:username/new", to: "articles#create"
  get "/:username", to: "articles#show_user_articles", as: "username"
  get "/:username/:slug", to: "articles#show_article_content", as: "article"
  post "/:username/:slug/comment", to: "articles#create_comment", as: "comment"
end
