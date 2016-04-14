class FilmSessionsController < ApplicationController
  before_action :set_film_session, only: [:show, :edit, :update, :destroy, :getBookingPlaces]

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
    @cinema = Cinema.find(params[:id])
    @test_test = params[:data_value] || []
    puts @test_test

    
    @array_length = params[:array_length]
    puts "Array length  #{@array_length}"


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

    respond_to do |format|
      if @film_session.save
        format.html { redirect_to @film_session, notice: 'Film session was successfully created.' }
        format.json { render :show, status: :created, location: @film_session }
      else
        format.html { render :new }
        format.json { render json: @film_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /film_sessions/1
  # PATCH/PUT /film_sessions/1.json
  def update
    respond_to do |format|
      if @film_session.update(film_session_params)
        format.html { redirect_to @film_session, notice: 'Film session was successfully updated.' }
        format.json { render :show, status: :ok, location: @film_session }
      else
        format.html { render :edit }
        format.json { render json: @film_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_sessions/1
  # DELETE /film_sessions/1.json
  def destroy
    @film_session.destroy
    respond_to do |format|
      format.html { redirect_to film_sessions_url, notice: 'Film session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_film_session
      @film_session = FilmSession.find(params[:id])
    end

    def getBookingPlaces
     @places = Place.all
     @placesBySession = @places.where(film_session_id: '1')
     @result = [] 
     for i in 0..@placesBySession.length-1
      @result.push(@placesBySession[i].place_number)
     end
     return @result
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_session_params
      params.require(:film_session).permit(:cinema_id, :session_name, :number_of_session_place)
    end
end
