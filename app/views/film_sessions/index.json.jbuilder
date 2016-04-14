json.array!(@film_sessions) do |film_session|
  json.extract! film_session, :id, :cinema_id, :session_name, :number_of_session_place
  json.url film_session_url(film_session, format: :json)
end
