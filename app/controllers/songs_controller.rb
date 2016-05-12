class SongsController < ApplicationController
  before_filter :set_artist

  def index
    @songs = @artist.songs.order(year: :asc)
  end

  def show
    @song = @artist.songs.find(params[:id])
  end
  def new
    @song = Song.new
  end

  def create
    @song = Song.new( song_params )
    @song.artist = @artist

      respond_to do |format|
      if @song.save
        format.html {redirect_to [@artist, @song], notice: "a new song was created"}
        format.json {render :show, status: :created, location: [@artist, @song]}
      else
        format.html {render :new}
        format.json {render json: @song.errors}
      end
    end
  end

  def edit
     @song = Song.find( params[:id] )
  end

   def update
     @song = @artist.songs.find( params[:id] )

     respond_to do |format|
       if @song.update(movie_params)
         format.html {redirect_to [@artist, @song], notice: "movie is updated"}
         format.json {render :show, status: :ok, location: [@artist, @song]}
       else
         format.html {render :edit}
         format.json {render json: @song.errors}
       end
     end
   end

   def destroy
     @song = @artist.songs.find(params[:id])

     respond_to do |format|
       if @song.destroy
         format.html {redirect_to @artists, notice: "song was destroyed"}
         format.json {head :no_content}
       else
         format.html {render :show}
         format.json {render json: @song.errors}
       end
     end
   end


  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

     def song_params
       params.require( :song ).permit( :title, :year, :album)
     end
end
