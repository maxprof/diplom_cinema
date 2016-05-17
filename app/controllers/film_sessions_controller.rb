class FilmSessionsController < ApplicationController
  before_action :set_film_session, only: [:edit, :update, :destroy, :getBookingPlaces]
  before_action :check_if_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :check_time_to_redirect, only: [:show]
  def index
    @film_sessions = FilmSession.all
  end


  def show
    @film_session = FilmSession.find(params[:id])
    @session_time = params[:session_time]
    @session_day = params[:day]

      if @session_time == nil || @session_day == nil || @session_day  < Date.today.to_s
        flash[:danger] = "Sessions with such parameters do not exist"
        return redirect_to '/calendar'
      else

      end

    @t = Time.now
    @booked_places = @film_session.places
    @test = getBookingPlaces
    @place = Place.new
    @array_of_places = params[:data_value] || []
    @array_length = params[:array_length]
    if @array_of_places != []
      render "form_for_places"
    end
  end

  def new
    @film_session = FilmSession.new
  end

  def edit
  end

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

  def update
    if @film_session.update(film_session_params)
      flash[:success] = "Film session was successufly updated"
      redirect_to film_session_path(@film_session)
    else
      render 'new'
    end
  end

  def destroy
    @film_session.destroy
    flash[:danger] = "Film session was successufly deleted"
    redirect_to film_sessions_path
  end

  private

    def check_time_to_redirect
      @session_times_list = SessionTime.all
      @session_times_list.each do |times_list|
        if @session_time.to_s != times_list.session_time.to_s
          flash[:danger] = "Sessions with such parameters do not exist"
            puts  "----------------------"
            puts  times_list.session_time
            puts  @session_time.nil?
            puts  @session_time.to_s == times_list.session_time.to_s

          return redirect_to '/calendar'
        end
      end
    end

    def check_if_admin
      if !user_signed_in? || !current_user.admin?
        flash[:danger] = "You have't access rights for this operation"
        redirect_to root_path
      end
    end

    def set_film_session
      @film_session = FilmSession.find(params[:id])
    end

    def getBookingPlaces
     @places = Place.all
     @placesBySession = @places.where(film_session_id: params[:id], session_time: @session_time, session_date: @session_day )
     @result = []
     for i in 0..@placesBySession.length-1
      @result.push(@placesBySession[i].place_number)
     end
     return @result
    end

    def film_session_params
      params.require(:film_session).permit(:session_start_date, :cinema_id, :session_name,
                                           :number_of_session_place, :user_id, :description,
                                           :rating, :trailer_link, :film_sessions_poster,
                                           :price, :session_end_date, category_ids: [],
                                           session_time_ids: [])
    end
end
