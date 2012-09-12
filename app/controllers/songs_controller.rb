class SongsController < ApplicationController
  def index
    @jams = Song.all.group_by(&:recorded_on)
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    debugger
    song_params = {:title => params[:song][:title],
                   :file => params[:song][:file],
                   :recorded_on => Date.new(params[:song]["recorded_on(1i)"].to_i,params[:song]["recorded_on(2i)"].to_i,params[:song]["recorded_on(3i)"].to_i)
    }
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song, notice: 'Song was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(params[:song])
      redirect_to @song, notice: 'Song was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_url
  end
end
