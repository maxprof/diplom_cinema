class HomeController < ApplicationController
  def index
  end
  def calendar
    @film_sessions = FilmSession.all
    @film_sessions_by_date = @film_sessions.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
