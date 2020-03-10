class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(s_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(s_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])

  end

  def index
    @songs = Song.all
  end


  private

  def s_params(*args)
    params.require(:song).permit(*args)
  end
end
