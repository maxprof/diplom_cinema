class SessionTime < ActiveRecord::Base
  has_many :film_session_session_times
  has_many :film_sessions, through: :film_session_session_times
end
