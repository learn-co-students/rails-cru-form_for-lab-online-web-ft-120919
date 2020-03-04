class GenresController < ApplicationController
  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new
    @genre.update(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      redirect_to new_genre_path
    end
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.update(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      redirect_to new_genre_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
