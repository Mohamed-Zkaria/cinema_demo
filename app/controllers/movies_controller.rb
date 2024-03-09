class MoviesController < ApplicationController
    def index
        render json: {movies: Movie.all}
    end

    def get_actor
        if params[:actor].nil?
            render json: { errors: ["empty actor"] },
                status: :unprocessable_entity
        end
        movies = Movie.where(actor: params[:actor])
        render json: {movies: movies}
    end

    def get_with_rating
        if params[:order].nil?
            render json: { errors: ["empty actor"] },
                status: :unprocessable_entity
        end

        if params[:order] == "asc"
            order = "ASC"
        else
            order = "DESC"
        end
        movies = Movie.joins(:reviews).group("movies.title").order("avg(stars) #{order}").average("reviews.stars")
        render json: {movies: movies}

    end
    
end