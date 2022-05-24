Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing_page#main"

  get "/register", to: "users#new"
  get "/register", to: "users#register"
  post "/register", to: "users#create"

  get "/dashboard", to: "users#show"
  get "/discover", to: "users#discover"
  get "/discover/movies", to: "users#movies"

  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"

  get "/movies/:movie_id", to: "movies#show"
  get "/movies/:movie_id/viewing-party/new", to: "movies#new"
  post "/movies/:movie_id/viewing-party", to: "movies#create"
end
