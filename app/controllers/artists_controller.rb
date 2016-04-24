class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(name: :asc)

    if params[:search]
      @artists = Artist.search(params[:search])
    else
       print "Sorry we don't know this artist yet. Try again!"
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end


end
