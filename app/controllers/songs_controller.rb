class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def show
    @song = Song.find_by(id: params[:id])
    @artist = @song.artist
    @genre = @song.genre
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    update_and_redirect(@song)
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    update_and_redirect(@song)
  end

  private

  def update_and_redirect(song)
    song.update(song_params)
    if song.save
      redirect_to song_path(song.id)
    elsif song.id
      redirect_to edit_song_path(song.id)
    else
      redirect_to new_song_path
    end
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
