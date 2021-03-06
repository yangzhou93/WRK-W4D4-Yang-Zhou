class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])

    if @album
      render :show
    else
      redirect_to bands_url
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to band_url(@album.band)
    else
      render :edit
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band)
   else
      render :new
    end
  end
  
  def destroy
    @album = Album.find_by(id: params[:id])
    @album.delete
  end


  private
  def album_params
    params.require(:album).permit(:title, :year, :live)
  end

end