class Api::MoviesController < ActionController::API
  def release
    movies = Movie.order(created_at: :desc).limit(10)
    render json: movies.as_json(include: [:director, :actors])
  end

  def top_rated
    movies = Movie.order(rating: :desc).limit(15)
    render json: movies.as_json(include: [:director, :actors])
  end
  
  def show
    movie = Movie.friendly.find(params[:id])
    render json: movie.as_json(include: [:director, :actors])
  rescue
    render json: nil
  end
end
