json.array!(@session_times) do |session_time|
  json.extract! session_time, :id, :time
  json.url session_time_url(session_time, format: :json)
end
