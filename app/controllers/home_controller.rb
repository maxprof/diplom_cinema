class HomeController < ApplicationController

  def index
  end
  def calendar
    @film_sessions = FilmSession.all
    @date = params[:session_start_date] ? Date.parse(params[:session_start_date]) : Date.today
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
  end

