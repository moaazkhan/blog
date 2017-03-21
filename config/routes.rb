Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Below is a specific route hence it should be on top as router searches for route from top to bottom
  get "/tags", to: "tag#index", as: "tags_index"

  get "/tags/new", to: "tag#new", as: "tags_new"
  post "/tags/new", to: "tag#create"

  get "/tags/:id/edit", to: "tag#edit", as: "tags_edit"
  patch "/tags/:id", to: "tag#update"
  put "/tags/:id", to: "tag#update"
  delete "/tags/:id", to: "tag#destroy"


  get "/", to: "articles#show_users", as: "root"
  get "/:username/new", to: "articles#new", as: "article_new"
  post "/:username/new", to: "articles#create"
  get "/:username", to: "articles#show_user_articles", as: "username"
  get "/:username/:slug", to: "articles#show_article_content", as: "article"
  post "/:username/:slug/comment", to: "articles#create_comment", as: "comment"

end
