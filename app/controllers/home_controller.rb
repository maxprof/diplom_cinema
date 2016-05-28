class HomeController < ApplicationController
  helper_method :inspect_film_session_date
  helper_method :find_session_time

  def index
    @film_session = FilmSession.last
    @news = News.order(:created_at).limit(2)
  end

  def calendar
    @film_sessions = FilmSession.all
    @film_sessions = @film_sessions.includes(:film_session_session_times)
    @date = params[:session_start_date] ? Date.parse(params[:session_start_date]) : Date.today
  end

  def inspect_film_session_date(date, film_session)
    film_session.session_start_date == date.to_s || ( film_session.session_start_date < date.to_s and date.to_s <= film_session.session_end_date )
  end

  def find_session_time(time)
    session_time = SessionTime.find(id = time.session_time_id).session_time
  end

  private

end



