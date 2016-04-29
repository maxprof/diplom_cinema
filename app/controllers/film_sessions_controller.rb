class FilmSessionsController < ApplicationController
  before_action :set_film_session, only: [:show, :edit, :update, :destroy, :getBookingPlaces]
  before_action :check_if_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :delete_overdue_places

  # GET /film_sessions
  # GET /film_sessions.json
  def index
    @film_sessions = FilmSession.all
  end


  # GET /film_sessions/1
  # GET /film_sessions/1.json
  def show
    @booked_places = @film_session.places
    @test = getBookingPlaces
    @place = Place.new
    @test_test = params[:data_value] || []
    @array_length = params[:array_length]
    if @test_test != []
      render "test"
    end
  end

  # GET /film_sessions/new
  def new
    @film_session = FilmSession.new
  end

  # GET /film_sessions/1/edit
  def edit
  end

  # POST /film_sessions
  # POST /film_sessions.json
  def create
    @film_session = FilmSession.new(film_session_params)
    @film_session.user_id = current_user.id

    if @film_session.save
      flash[:success] = "New film session was successufly created"
      redirect_to film_session_path(@film_session)
    else
      render 'new'
    end
  end

  # PATCH/PUT /film_sessions/1
  # PATCH/PUT /film_sessions/1.json
  def update
    if @film_session.update(film_session_params)
      flash[:success] = "Film session was successufly updated"
      redirect_to film_session_path(@film_session)
    else
      render 'new'
    end
  end

  # DELETE /film_sessions/1
  # DELETE /film_sessions/1.json
  def destroy
    @film_session.destroy
    flash[:danger] = "Film session was successufly deleted"
    redirect_to film_sessions_path
  end

  private
    def delete_overdue_places
      @places = Place.all
      @t = Time.now
      @places.each do |place|
        if @t > place.date - 8.hour
          place.destroy
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
    def set_film_session
      @film_session = FilmSession.find(params[:id])
    end

    def getBookingPlaces
     @places = Place.all
     @placesBySession = @places.where(film_session_id: params[:id])
     @result = []
     for i in 0..@placesBySession.length-1
      @result.push(@placesBySession[i].place_number)
     end
     return @result
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_session_params
      params.require(:film_session).permit(:date, :cinema_id, :session_name, :number_of_session_place, :user_id, :description, :rating, :trailer_link, :film_sessions_poster)
    end
end
