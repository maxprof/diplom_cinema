json.array!(@places) do |place|
  json.extract! place, :id, :cinema_id, :FilmSession_id, :place_number, :status
  json.url place_url(place, format: :json)
end
