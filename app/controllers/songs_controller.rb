class SongsController < ApplicationController
  def show
    @song = Song.find_by(id: params[:id])
    @artist = Artist.find_by(id: @song.artist_id)
    @genre = Genre.find_by(id: @song.genre_id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:name))
    @song.artist = Artist.find_by(id: params[:song][:artist_id])
    @song.genre = Genre.find_by(id: params[:song][:genre_id])
    @song.save
    redirect_to song_path(@song)
  end
  
  def edit
    @song = Song.new
  end

  def update
    @song = Song.update(song_params(:name))
    @song.artist = Artist.find_by(id: params[:song][:artist_id])
    @song.genre = Genre.find_by(id: params[:song][:genre_id])
    @song.save
    redirect_to song_path(@song)
  end

  def index
    @songs = Song.all
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
