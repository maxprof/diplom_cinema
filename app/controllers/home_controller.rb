class HomeController < ApplicationController

  def index
    @film_session = FilmSession.last
    @news = News.order(:created_at).limit(2)
  end

  def calendar
    @film_sessions = FilmSession.all
    @film_sessions = @film_sessions.includes(:film_session_session_times)
    @date = params[:session_start_date] ? Date.parse(params[:session_start_date]) : Date.today
  end

  private

end


