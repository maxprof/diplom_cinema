json.array!(@cinemas) do |cinema|
  json.extract! cinema, :id, :cinema_name, :cinema_addr
  json.url cinema_url(cinema, format: :json)
end
