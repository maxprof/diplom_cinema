class FilmSessionsController < ApplicationController
  before_action :delete_old_places, only: [:show]
  before_action :set_film_session, only: [:show, :edit, :update, :destroy, :getBookingPlaces]
  before_action :check_if_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  def index
    @film_sessions = FilmSession.where(["session_name LIKE ?","%#{params[:search]}%"])
    @film_sessions = FilmSession.where(["description LIKE ?","%#{params[:search]}%"])
  end


  def show
    session[:id] = @film_session.id
    session[:type] = "FilmSession"
    #Get params from calendar

    @session_time = params[:session_time]
    @session_day = params[:day]

    # get list of session times for this FilmSession

    @list_of_session_times = @film_session.session_times.where(session_time: @session_time)

    if @list_of_session_times.empty?
      @times_presence = false
    else
      @times_presence = true
    end

    # Check if FelmSession with this parameters presence

    if !@times_presence || @session_time == nil || @session_day == nil || @session_day  < Date.today.to_s || @session_day > @film_session.session_end_date
       flash[:danger] = "Sessions with such parameters do not exist"
       return redirect_to calendar_url
     else
    end

    # Get comments

    @comments = Comment.where(commentable_id: @film_session.id).paginate(page: params[:page], per_page: 5)

    # functional for places array

    @t = Time.now
    @booked_places = @film_session.places
    @test = getBookingPlaces
    @array_of_places = params[:data_value] || []
    @place = Place.new

    if @array_of_places.length > 1
      @array_for_save = []
      @array_of_places.length.times do |save_record|
        @array_for_save << Place.new
      end
    end

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
      redirect_to calendar_path
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

    def delete_old_places
      @film_sessions_places = FilmSession.all
      @film_sessions_places.each do |film_session_place|
        film_session_place.places.each do |place|
          if Date.today.to_s > place.session_date
            place.delete
          end
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
