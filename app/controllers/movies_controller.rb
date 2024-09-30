class MoviesController < ApplicationController
  def index
    @movies = Movie.all  # fetch all movies from the database
  end

  def show
    @movie = Movie.find(params[:id])  # find movie by id
  end

  def new
    @movie = Movie.new  # create new movie object
  end

  def create
    @movie = Movie.new(movie_params)  # create new movie object with parameters
    if @movie.save
      redirect_to movie_path(@movie), notice: 'Movie was successfully created.'  # redirect on success
    else
      render :new, status: :unprocessable_entity  # render form again on error
    end
  end

  def edit
    @movie = Movie.find(params[:id])  # find movie object to edit
  end

  def update
    @movie = Movie.find(params[:id])  # find movie object for updating
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Movie was successfully updated.'  # redirect on success
    else
      render :edit, status: :unprocessable_entity  # render form again on error
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: 'Movie was successfully deleted.'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)  # allowed parameters
  end
end
