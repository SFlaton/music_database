class SongsController < ApplicationController
  def index
    @songs = Song.order(year: :asc)
  end

  def show
  end
end
