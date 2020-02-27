class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    #params getting passed from new.html.erb form 
    @artist = Artist.new(params.require(:artist).permit(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    #params[:id] from dynamic RESTful url GET '/artists/:id/edit'
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    @artist = Artist.find_by(id: params[:id])
    @artist.update(params.require(:artist).permit(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def show
    @artist = Artist.find_by(id: params[:id])
  end

end