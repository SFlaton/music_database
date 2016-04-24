class SongsController < ApplicationController
  def index
    @songs = Song.order(year: :asc)
  end

  def show
    @song = Song.find(params[:id])
  end
end
