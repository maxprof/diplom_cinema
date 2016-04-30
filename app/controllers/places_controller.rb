class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :delete_overdue_places
  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  # GET /places/1/edit
  def edit
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id

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
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    flash[:danger] = "Place was successufly deleted"
    redirect_to places_path
  end

  private

    def delete_overdue_places
      @t = Time.now
      if @places
        @places.each do |place|
          if @t > place.date - 8.hour
            place.destroy
          end
        end
      elsif @place
        if @t > @place.date - 8.hour
           @place.destroy
        end
      end
    end

    def check_if_admin
      if !user_signed_in? || !current_user.admin?
        flash[:danger] = "You have't access rights for this operation"
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:date,:cinema_id, :film_session_id, :place_number, :status, :user_id)
    end
end
