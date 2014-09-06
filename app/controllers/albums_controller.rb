class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_album, only: [ :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    # show all abums, no sign-in required
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    # show album with associated photos
    # used includes for eagar loading photos to avoid n+1 problem
    @album = Album.includes(:photos).find(params[:id])
  end

  # GET /albums/new
  def new
    # creates new object for album
    @album = Album.new
    # album with one photo
    @album.photos.build
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    # creates album with associated photos
    @album = current_user.albums.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    # updates album with associated photos
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    # destroy album with associated photos
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = current_user.albums.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # permits album with photos attributes
    def album_params
      params.require(:album).permit(:name, :user_id, :photos_attributes => [:image, :tag_line,:id,:_destroy])
    end
end
