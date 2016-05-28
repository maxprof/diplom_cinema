class ApplicationController < ActionController::Base
  helper_method :find_session_name_for_user_place


  def find_session_name_for_user_place(place)
    session_name = FilmSession.find(id = place.film_session_id).session_name
  end

  protect_from_forgery with: :exception
end
