Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/movies", to: "movies#index", as: :get_movies

  get "/movies/:actor", to: "movies#get_actor", as: :get_actors
  get "/movies/rating/:order", to: "movies#get_with_rating", as: :get_movie_rating

  # Defines the root path route ("/")
  # root "posts#index"
end
