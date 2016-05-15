class FilmSessionSessionTime < ActiveRecord::Base
  belongs_to :film_session
  belongs_to :session_time
end
