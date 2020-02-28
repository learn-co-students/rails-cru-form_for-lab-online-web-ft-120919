class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(class_params(:name, :bio))
        redirect_to song_path(@song)
    end

    def update
        @song = Song.find(params[:id])
        @song.update(class_params(:name, :bio))
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    private

	def class_params(*args)
		params.require(:song).permit(*args)
	end

end