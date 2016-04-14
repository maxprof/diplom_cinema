class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    if @place.save
      flash[:success] = "New place was successufly created"
      redirect_to place_path(@place)
    else
      render 'new'
    end

  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if @place.update(place_params)
      flash[:success] = "Place was successufly updated"
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    flash[:danger] = "Place was successufly deleted"
    redirect_to places_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:cinema_id, :film_session_id, :place_number, :status)
    end
end
