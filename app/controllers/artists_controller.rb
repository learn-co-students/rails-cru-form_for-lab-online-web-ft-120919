class ArtistsController < ApplicationController
  def show
    @artist = Artist.find_by(id: params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    end
  end

  def edit
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    @artist = Artist.find_by(id: params[:id])
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
