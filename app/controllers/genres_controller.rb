class GenresController < ApplicationController
  def index
    
  end
  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre=Genre.new
  end
  def create
    @genre=Genre.new(strong_params)    
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render 'new'
      
    end
  end
  
  def edit
    @genre=Genre.find(params[:id])    
  end

  def update
    @genre=Genre.find(params[:id])
    @genre.update(strong_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render 'edit'
    end
    
  end

  private
  def strong_params
    params.require(:genre).permit(:name)    
  end
end
