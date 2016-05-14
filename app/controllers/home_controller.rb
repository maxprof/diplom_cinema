class HomeController < ApplicationController
  def index
  end
  def calendar
    @film_sessions = FilmSession.all
    @date = params[:session_start_date] ? Date.parse(params[:session_start_date]) : Date.today
  end
end
