class FilmSessionsController < ApplicationController
  before_action :delete_old_places, only: [:show]
  before_action :check_booking_time, only: [:show]
  before_action :set_film_session, only: [ :show, :edit, :update, :destroy, :getBookingPlaces]
  before_action :check_if_admin, only: [:new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  helper_method :find_user_comment_id

  def index
    check_search_params
    @film_sessions = @film_sessions.includes(:places)
    @film_sessions = @film_sessions.includes(:categories)
  end

  def show
    #create params for comments
    session[:id] = @film_session.id
    session[:type] = "FilmSession"
    #Get params from calendar
    @session_time = params[:session_time]
    @session_day = params[:day]
    get_list_of_session_times
    check_session_params
    get_comments
    places_functional
  end

  def new
    @film_session = FilmSession.new
  end

  def edit
  end

  def create
    @film_session = current_user.film_sessions.build(film_session_params)
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

    def check_search_params
      if params[:search].nil?
        @film_sessions = FilmSession.all
      else
        @film_sessions = FilmSession.search(params[:search])
      end
    end

    def find_user_comment_id(comment)
      user_comment = User.find(id = comment.user_id )
    end

    def check_session_params
      if !@times_presence || @session_time == nil || @session_day == nil || @session_day  < Date.today.to_s || @session_day > @film_session.session_end_date
         flash[:danger] = "Sessions with such parameters do not exist"
         return redirect_to calendar_url
      end
    end

    def get_list_of_session_times
      if @film_session.session_times.where(session_time: @session_time).empty?
        @times_presence = false
      else
        @times_presence = true
      end
    end

    def get_comments
      @comments = Comment.where(commentable_id: @film_session.id).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end

    def places_functional
      @t = Time.now
      @booked_places = @film_session.places
      @test = getBookingPlaces
      @array_of_places = params[:data_value] || []
      @array_length = params[:array_length]
      if @array_of_places != []
        render "form_for_places", :layout => false
      end
    end

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
      @film_session = FilmSession.where(id: params[:id]).limit(1).first
      if !@film_session.present?
        redirect_to '/errors/not_found'
      end
    end

    def check_booking_time
      @places = Place.all
      @places.each do |place_booked_time|
        if place_booked_time.status == false
          @test_time = Time.now.to_s.to_time - place_booked_time.created_at.to_s.to_time
          if @test_time.to_i > 3.hours.to_i
            place_booked_time.destroy
          end
        end
      end
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
