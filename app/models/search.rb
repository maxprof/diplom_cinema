class Search < ActiveRecord::Base

  def search_film_sessions

    film_sessions = FilmSession.all
    film_sessions = film_sessions.where(["session_name LIKE ?","%#{keywords}%"]) if keywords.present?
    film_sessions = film_sessions.where(["category LIKE ?", category]) if category.present?
    film_sessions = film_sessions.where(["rating ?", rating]) if rating.present?
    film_sessions = film_sessions.where(["max_price <=", max_price]) if max_price.present?

    return film_sessions
  end
end
