class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:name, :genre_id, :artist_id))
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    set_song 
  end

  def update
    set_song
    @song.update(params.require(:song).permit(:name, :genre_id, :artist_id))
    redirect_to song_path(@song)
  end

  def show
    set_song
    @artist = @song.artist
    @genre = @song.genre 
  end

  private

  def set_song
    @song = Song.find_by(id: params[:id])
  end

end 