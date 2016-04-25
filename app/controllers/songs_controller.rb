class SongsController < ApplicationController
  def index
    @songs = Song.order(year: :asc)
  end

  def show
    @song = Song.find(params[:id])
  end
  def new
     @song = Song.new
     @song.artist_id = params[:artist_id]
  end

  def create
        song = Song.new( novel_params )

        if song.save
           redirect_to artist_path( song.artist_id )
        else
           render new_song_path
        end
  end

  def edit
     @song = Song.find( params[:id] )
  end

   def update
     @song = Song.find( params[:id] )

     if @song.update_attributes( song_params )
       redirect_to @song
     else
       render 'edit'
     end
   end


  private

     def song_params
       params.require( :song ).permit( :title, :year, :album)
     end
end
